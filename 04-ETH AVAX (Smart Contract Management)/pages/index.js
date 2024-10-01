import { useState, useEffect } from "react";
import { ethers } from "ethers";
import contract_abi from "../artifacts/contracts/Assessment.sol/Assessment.json";

export default function HomePage() {
  const [ethWallet, setEthWallet] = useState(undefined);
  const [account, setAccount] = useState(undefined);
  const [contract, setContract] = useState(undefined);
  const [isMember, setIsMember] = useState(undefined);

  const contractAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";
  const contractABI = contract_abi.abi;

  const getWallet = async () => {
    if (window.ethereum) {
      setEthWallet(window.ethereum);
    }

    if (ethWallet) {
      const account = await ethWallet.request({ method: "eth_accounts" });
      handleAccount(account);
    }
  };

  const handleAccount = (account) => {
    if (account.length > 0) {
      console.log("Account connected: ", account[0]);
      setAccount(account[0]);
    } else {
      console.log("No account found");
    }
  };

  const connectAccount = async () => {
    if (!ethWallet) {
      alert('MetaMask wallet is required to connect');
      return;
    }

    const accounts = await ethWallet.request({ method: 'eth_requestAccounts' });
    handleAccount(accounts);
    getContract();
  };

  const getContract = () => {
    const provider = new ethers.providers.Web3Provider(ethWallet);
    const signer = provider.getSigner();
    const contractInstance = new ethers.Contract(contractAddress, contractABI, signer);
    setContract(contractInstance);
  };

  const checkMembership = async () => {
    if (contract) {
      try {
        const membershipStatus = await contract.isMember(account);
        if (membershipStatus) {
          console.log("You are a member.");
        } else {
          console.log("You are not a member.");
        }
        setIsMember(membershipStatus);
      } catch (error) {
        console.error("Error checking membership:", error);
      }
    }
  };

  const registerMember = async () => {
    if (contract) {
      let tx = await contract.registerMember(account);
      await tx.wait();
      checkMembership();
    }
  };

  const initUser = () => {
    if (!ethWallet) {
      return <p>Please install MetaMask or other crypto wallets to use this DApp.</p>;
    }

    if (!account) {
      return <button onClick={connectAccount}>Connect Wallet</button>;
    }

    if (isMember === undefined) {
      checkMembership();
    }

    return (
      <div>
        <p><strong>Your Account:</strong> {account}</p>
        <p><strong>Membership Status:</strong> {isMember ? "Member" : "Not a Member"}</p>
        {!isMember && <button onClick={registerMember}>Register</button>}
      </div>
    );
  };

  useEffect(() => { getWallet(); }, []);

  return (
    <main className="container">
      <header><h1>Welcome to the Membership DApp!</h1></header>
      <div>{initUser()}</div>
      <style jsx>{
        `.container {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh;
        text-align: center;
        font-family: Helvetica, sans-serif;
      }`
      }</style>
    </main>
  );
}
