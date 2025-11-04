//
//  ContentView.swift
//  AstractConnectExample
//
//  Created by scott on 2025/10/21.
//

import SwiftUI
import AstraConnect

@Observable
class RPCInfoModel {
    
    // Using devnet by default
    var address = "https://api.devnet.solana.com"
}

@Observable
class BlockCommitmentModel {
    var blockHeightStr = "5"
    var commitments: ACSolanaCommitments?
    var commitmentDesc: String {
        guard let commitments = commitments else {
            return "Empty commitments"
        }
        return "\(commitments)"
    }
    var gettingBlkCommit = false
    
    let infoDesc = "block height:"
    
    let eventDesc = "Get Block Commitment"
}

@Observable
class BlockBalanceModel {
    /// Current balance.
    var balance: UInt64 = 0
    
    /// Whether is gettting balance.
    var gettingBalance = false
}

@Observable
class AccountInfoModel {
    /// Account information.
    var acctInfo: ACSolanaAccountInfo?
    
    /// String of account information to display.
    var acctInfoStr: String {
        get {
            guard let acctInfo = acctInfo else {
                return "Empty account info"
            }
            return "\(acctInfo)"
        }
    }
    
    /// Whether is gettting account Info.
    var gettingAcctInfo = false
    
    let infoDesc = "Account info:"
    
    let eventDesc = "Get account info"
}

@Observable
class BlockInfoModel {
    /// The Max length of presented block inforamtion.
    static let blkInfoMaxLen = 500
    var blockInfo: ACSolanaGetBlock.BlockInfo?
     
    /// Description of  block Information.
    var blockInfoDesc: String {
        get {
            guard let blockInfo = blockInfo else {
                return "Empty block info"
            }
            let content = "\(blockInfo)"
            let startIndex = content.startIndex
            let endIndex = content.index(startIndex,
                                         offsetBy: min(Self.blkInfoMaxLen, content.count))
           return String(content[startIndex..<endIndex])
        }
    }
    var slotNumStr = "378967388"
    
    /// Whether is gettting block  info.
    var gettingBlkInfo = false
}

@Observable
class CurrentBlockHeightModel {
    
    /// Current block height.
    var curBlkHeight: UInt64 = .zero
    
    var curBlkHeightStr: String {
        get {
            "\(curBlkHeight)"
        }
        
        set {}
    }
     
    /// Whether is gettting block height.
    var gettingBlkHeight = false
    
    let infoDesc = "Current block height:"
    
    let eventDesc = "Get Current Block Height"
}

@Observable
class BlockProductionModel {
    
    /// Whether is gettting the block  production.
    var gettingBlkProd = false
    
    /// Production information.
    var production: ACSolanaProduction?
    
    var firstSlot: UInt64 = 418321786
    
    ///  String description of ACSolanaProduction.
    var productionStr: String {
        guard let production = production else {
            return "Empty production"
        }
        return "\(production)"
    }
    
    let infoDesc = "Block production:"
    
    let eventDesc = "Get Block Production"
}

@Observable
class BlocksModel {
    
    /// Whether is gettting  blocks .
    var gettingBlocks = false
    
    /// Blocks information.
    var blocks = [UInt64]()
    
    /// The start Slot
    var startSlot: UInt64 {
        guard let startSlot = UInt64(startSlotStr) else {
            return 405178239
        }
        return startSlot
    }
     
    /// The start Slot string.
    var startSlotStr: String = "405178239"
    
    /// The end Slot
    var endSlot: UInt64 {
        guard let endSlot = UInt64(endSlotStr) else {
            return 405178250
        }
        return endSlot
    }
     
    /// The end Slot string.
    var endSlotStr: String = "405178250"
}

@Observable
class LimitedBlocksModel {
    
    /// Whether is gettting limitted blocks.
    var gettingBlocks = false
    
    /// The start Slot
    var startSlot: UInt64 {
        guard let startSlot = UInt64(startSlotStr) else {
            return 405178239
        }
        return startSlot
    }
     
    /// The start Slot string.
    var startSlotStr: String = "405178239"
    
    /// The limited block number to be fetched.
    var limit: UInt64 {
        guard let limit = UInt64(limitStr) else {
            return 3
        }
        return limit
    }
    
    /// The string of limit number.
    var limitStr: String = "3"

    
    /// Blocks information.
    var blocks = [UInt64]()
    
}

@Observable
class BlockTimeModel {
    
    /// Whether is gettting the production time of a block.
    var gettingBlkTime = false
    
    /// The start Slot string.
    var blockHeightStr: String = "405131569"
    
    /// The limited block number to be fetched.
    var blockHeight: UInt64 {
        guard let blockHeight = UInt64(blockHeightStr) else {
            return 405131569
        }
        return blockHeight
    }
    
    /// The production time of current block.
    var blockTime: UInt64 = 0
}

@Observable
class ClusterNodesModel {
    
    /// Whether is gettting nodes informantion.
    var gettingNodes = false
    
    /// Nodes array.
    var nodes: [ACSolanaClusterNode] = []
        
    let infoDesc = "Nodes info:"
    let eventDesc = "Get Cluster Nodes"
}

@Observable
class EpochInfoModel {
    
    /// Whether is gettting the current epoch informantion.
    var gettingEpochInfo = false
    
    /// Epoch informantion.
    var epochInfo: ACSolanaEpochInformation?
    
    /// The string description of  current epoch information.
    var epochInfoStr: String {
        get {
            guard let epochInfo = epochInfo else {
                return "Empty epoch info"
            }
            return "\(epochInfo)"
        }
    }
    let infoDesc = "Current epoch info:"
    let eventDesc = "Get current epoch info"
}

@Observable
class EpochScheduleInfoModel {
    
    /// Whether is gettting the epoch schedule informantion.
    var gettingEpochScheduleInfo = false
    
    /// Epoch informantion.
    var epochScheduleInfo: ACSolanaEpochScheduleInformation?
    
    /// The string description of  current epoch information.
    var epochScheduleInfoStr: String {
        get {
            guard let epochScheduleInfo = epochScheduleInfo else {
                return "Empty epoch schedule info"
            }
            return "\(epochScheduleInfo)"
        }
    }
    
    let infoDesc = "Epoch Schedule:"
    
    let eventDesc = "Get Epoch Schedule"
}

@Observable
class FeeForMessageModel {
    
    /// Whether is gettting the fee for a Base-64 message.
    var gettingFeeForMessag = false
    
    /// Epoch informantion.
    var feeForMessag: UInt64?
    
    var feeStr: String {
        guard let feeForMessag = feeForMessag else {
            return "0"
        }
        return "\(feeForMessag)"
    }
    
    /// Corresponding Base-64 message.
    var message: String = "AQABAgIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEBAQAA"
    
    let infoDesc = "Fees for message:"
    
    let eventDesc = "Get fee for message"
}

@Observable
class FirstAvailableBlockModel {
    
    /// Whether is gettting first available block.
    var gettingFirstAvailableBlock = false
    
    /// The slot of the lowest confirmed block .
    var slot: UInt64? = .zero
    
    var slotStr: String {
        get {
            guard let slot = slot else {
                return "0"
            }
            return "\(slot)"
        }
        
        set {
            print("slotStr set to \(newValue)")
        }
    }
    
    
    let infoDesc = "First available block:"
    
    let eventDesc = "Get First Available Block"
}

@Observable
class GenesisHashModel {
    
    /// Whether is gettting the Genesis Hash.
    var gettingGenesisHash = false
    
    /// A Hash as base-58 encoded string.
    var genesisHash = "Empty hash"
    
    let infoDesc = "Genesis Hash:"
    
    let eventDesc = "Get Genesis Hash"
}

@Observable
class NodeIdentityModel {
    
    /// Whether is gettting the node identity.
    var gettingIdentity = false
    
    var nodeIdentity: ACSolanaNodeIdentity?
    
    var identity: String {
        guard let identity = nodeIdentity?.identity else {
            return "Empty identity"
        }
        return identity
    }
    
    let infoDesc = "Node Identity:"
    
    let eventDesc = "Get Identity"
}

@Observable
class HealthModel {
    
    /// Whether is gettting the health status.
    var gettingHealth = false
    
    var healthStatus = "unknown"
    
    let infoDesc = "Health status"
    
    let eventDesc = "Get Node Health "
}

@Observable
class HighestSnapshotSlotModel {
    
    var gettingSlot = false
    
    var slotInfo: ACSolanaSnapshotSlotInfo?
    
    var slotInfoStr: String {
        get {
            guard let slotInfo = slotInfo else {
                return "Empty Slots"
            }
            return "\(slotInfo)"
        }
        
        set {}
    }
    
    let infoDesc = "Highest Snapshot Slot:"
    
    let eventDesc = "Get Highest Snapshot Slot "
}

@Observable
class InflationGovernorModel {
    
    var gettingGovernor = false
    
    var governor: ACSolanaInflationGovernor?
    
    var governorStr: String {
        guard let governor = governor else {
            return "Empty Governor"
        }
        return "\(governor)"
    }
    
    let infoDesc = "Inflation Governor:"
    
    let eventDesc = "Get Inflation Governor"
}


@Observable
class InflationRateModel {
    
    var gettingRate = false
    
    var rate: ACSolanaInflationRate?
    
    var rateStr: String {
        guard let rate = rate else {
            return "Empty Rate"
        }
        return "\(rate)"
    }
    
    let infoDesc = "Inflation Rate:"
    
    let eventDesc = "Get Inflation Rate"
}

@Observable
class InflationRewardModel {
    
    var gettingReward = false
    
    var rewards: [ACSolanaInflationReward?]?
    
    var rewardStr: String {
        guard let rewards = rewards else {
            return "Empty reward"
        }
        return "\(rewards)"
    }
    
    var epochStr = "800"
    
    var epoch: UInt64 {
        get {
            guard let val = UInt64(epochStr) else {
                return 800
            }
            return val
        }
        
        set {}
    }
    
    var addresses = ["6dmNQ5jwLeLk5REvio1JcMshcbvkYMwy26sJ8pbkvStu", "BGsqMegLpV6n6Ve146sSX2dTjUMj3M92HnU8BbNRMhF2"]
    
    
    let infoDesc = "Inflation Reward Of Epoch:"
    
    let eventDesc = "Get Inflation Reward"
}

@Observable
class LargestAccountsModel {
    
    var gettingAccounts = false
    
    var acctInfo: [ACSolanaGetLargestAccounts.Info]?
    
    var acctInfoStr: String {
        guard let acctInfo = acctInfo else {
            return "Empty account Info"
        }
        return "\(acctInfo)"
    }
        
    let infoDesc = "Largest Accounts:"
    
    let eventDesc = "Get Largest Accounts"
}

@Observable
class LatestBlockInfoModel {
    
    var gettingBlkInfo = false
    
    var blkInfo: ACSolanaLatestBlockInfo?
    
    var blkInfoStr: String {
        guard let blkInfo = blkInfo else {
            return "Empty block Info"
        }
        return "\(blkInfo)"
    }
        
    let infoDesc = "Latest block info:"
    
    let eventDesc = "Get Latest block"
}

@Observable
class LeaderScheduleModel {
    
    var gettingSchedule = false
    
    var schedule: [String: [UInt64]]?
    
    var scheduleStr: String {
        guard let schedule = schedule,
              let firstKey = schedule.keys.first,
              let firstValue = schedule.values.first else {
            return "Empty schedule Info"
        }
        return "\(firstKey): \(firstValue)"
    }
        
    let infoDesc = "Leader Schedule:"
    
    let eventDesc = "Get Leader Schedule"
}

@Observable
class MaxRetransmitSlotModel {
    
    var gettingSlot = false
    
    var slot: UInt64 = .zero
    
    let infoDesc = "Max Retransmit Slot:"
    
    let eventDesc = "Get Max Retransmit Slot"
}

@Observable
class MaxShredInsertSlotModel {
    
    var gettingSlot = false
    
    var slot: UInt64 = .zero
    
    let infoDesc = "Max Shred Insert Slot:"
    
    let eventDesc = "Get Shred Insert Slot"
}

@Observable
class MinimumBalanceForRentExemptionModel {
    
    var gettingBalance = false
    
    var balance: UInt64 = .zero
    
    let accountDataLength: UInt64 = 50
    
    let infoDesc = "Min balance for rent exemption:"
    
    let eventDesc = "Get Min Balance For Rent Exemption"
}

@Observable
class MultiAccountsInfoModel {
    
    /// Accounts information.
    var acctsInfo: [ACSolanaAccountInfo]?
    
    /// String of account information to display.
    var acctsInfoStr: String {
        get {
            guard let acctsInfo = acctsInfo else {
                return "Empty account info"
            }
            return "\(acctsInfo)"
        }
    }
    
    /// Whether is gettting account Info.
    var gettingAcctsInfo = false
    
    let pubKeys = ["vines1vzrYbzLMRdu58ou5XTby4qAqVRLmqo36NKPTg",
                   "4fYNw3dojWmQ4dXtSGE9epjRGy9pFSx62YypT7avPYvA",]
    
    let infoDesc = "Multiple Accounts:"
    
    let eventDesc = "Get Multiple Accounts"
}

@Observable
class ProgramAccountsModel {
    
    var pubkey = "dRiftyHA39MWEi3m9aunc5MzRF1JYuBsbn6VPcn33UH"
    
    var filters = [ACSolanaDataFilter(dataSize: 17),
                   ACSolanaDataFilter(memcmp: ACSolanaDataFilter.memCmp(offset: 4,
                                                                        bytes: "3Mc6vR",
                                                                        encoding: ACSolanaRPCAPI.encodingKind.base58))]
    
    // Accounts information.
    var acctsInfo: [ACSolanaProgramAccountInfo]?
    
    /// String of account information to display.
    var acctsInfoStr: String {
        get {
            guard let acctsInfo = acctsInfo?.first else {
                return "Empty program account info"
            }
            return "\(acctsInfo)"
        }
    }
    
    /// Whether is gettting account Info.
    var gettingAcctsInfo = false
    
    let infoDesc = "Program Account:"
    
    let eventDesc = "Get Program Account"
}

@Observable
class RecentPerformanceSamplesModel {
    
    var sampleNumStr = "5"
    
    var sampleNum: UInt {
        get {
            guard let val = UInt(sampleNumStr) else {
                return 5
            }
            return val
        }
        
        set {}
    }
    
    var samples: [ACSolanaPerformanceSample]?
    
    var gettingSamples = false
    
    let infoDesc = "Performance Samples Number:"
    
    let eventDesc = "Get Performance Samples"
}

@Observable
class PrioritizationFeesModel {
    var sampleNumStr = "5"
    
    var feesInfo: [ACSolanaPrioritizationFeeInfo]?
    
    var acctAddr = "CxELquR1gPP8wHe33gZ4QxqGB3sZ9RSwsJ2KshVewkFY"
    
    var gettingFees = false
    
    let infoDesc = "Prioritization Fees:"
    
    let eventDesc = "Get Prioritization Fees"
}

@Observable
class SignaturesForAddressModel {
    var address = "Vote111111111111111111111111111111111111111"
    
    var signatures: [ACSolanaSignatureInfo]?
        
    var gettingSignatures = false
    
    let infoDesc = "Signatures For Address:"
    
    let eventDesc = "Get Signatures For Address"
}

@Observable
class SignatureStatusesModel {
    
    var signature = "3GPLVxrf1qnjnC3WCtPc9uNgB5xtdWqCpp4WDSkCXFxrtyAMjGvuizbHwTnw1xfvp128275pkxC9MbTwDGRS9PsF"
    
    var statuses: [ACSolanaSignatureStatus?]?
        
    var gettingStatuses = false
    
    let infoDesc = "Statuses for Signatures:"
    
    let eventDesc = "Get Signatures Statuses"
}

@Observable
class SlotModel {
        
    var slot: UInt64 = 0
        
    var gettingSlot = false
    
    let infoDesc = "Slot:"
    
    let eventDesc = "Get Slot"
}

@Observable
class SlotLeaderModel {
        
    var slotleader = "unknown leader"
        
    var gettingSlotLeader = false
    
    let infoDesc = "Slot Leader:"
    
    let eventDesc = "Get Slot Leader"
}

@Observable
class SlotLeadersModel {
        
    var slotleaders: [String] = ["unknown leaders"]
    
    var startSlotStr = "418326111"
     
    var startSlot: UInt64 {
        get {
            guard let val = UInt64(startSlotStr) else {
                return 418326111
            }
            return val
        }
        set {}
    }
    
    var limit: UInt64 = 10
    var gettingSlotLeaders = false
    
    let infoDesc = "Slot Leaders:"
    
    let eventDesc = "Get Slot Leaders"
}


@Observable
class StakeMinDelegationModel {
    
    var commitment = ACSolanaRPCAPI.StateCommitment.finalized
    
    var minDelegation: UInt64 = .zero
    
    var gettingelegation = false
    
    let infoDesc = "Stake Min Delegation:"
    
    let eventDesc = "Get Stake Min Delegation"
}

@Observable
class SupplyModel {
    
    var commitment = ACSolanaRPCAPI.StateCommitment.finalized
    
    var supplyInfo: ACSolanaSupplyInfo?
    
    var gettingSupply = false
    
    let infoDesc = "Supply info:"
    
    let eventDesc = "Get Supply"
}

@Observable
class TokenAccountBalanceModel {
    
    var commitment = ACSolanaRPCAPI.StateCommitment.finalized
    
    var balance: ACSolanaTokenAccountBalance?
    
    var gettingBalance = false
    
    var tokenAcct = "48gpnn8nsmkvkgso7462Z1nFhUrprGQ71u1YLBPzizbY"
    
    let infoDesc = "Token Account Balance:"
    
    let eventDesc = "Get Token Account Balance"
}

@Observable
class TokenAccountsByDelegateModel {
    var commitment = ACSolanaRPCAPI.StateCommitment.finalized
    
    var delegate = "vines1vzrYbzLMRdu58ou5XTby4qAqVRLmqo36NKPTg"
    
    var programId = "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA"
    
    var accts: [ACSolanaProgramAccountInfo]?
    
    var gettingAccounts = false
        
    let infoDesc = "Token Accounts By Delegate:"
    
    let eventDesc = "Get Token Accounts By Delegate"
}

@Observable
class TokenAccountsByOwnerModel {
    
    var commitment = ACSolanaRPCAPI.StateCommitment.finalized
    
    var owner = "A1TMhSGzQxMr1TboBKtgixKz1sS6REASMxPo1qsyTSJd"
    
    var programId = "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA"
    
    var accts: [ACSolanaProgramAccountInfo]?
    
    var gettingAccounts = false
        
    let infoDesc = "Token Accounts By Owner:"
    
    let eventDesc = "Get Token Accounts By Owner"
}

@Observable
class TokenLargestAccountsModel {
    
    var commitment = ACSolanaRPCAPI.StateCommitment.finalized
    
    var tokenAddr = "Gh9ZwEmdLJ8DscKNTkTqPbNwLNNBjuSzaG9Vp2KGtKJr"
        
    var acctsInfo: [ACSolanaTokenAccountInfo]?
    
    var gettingAccounts = false
        
    let infoDesc = "Largest Accounts of token:"
    
    let eventDesc = "Get Largest Accounts"
}

@Observable
class TokenSupplyModel {
    
    var commitment = ACSolanaRPCAPI.StateCommitment.finalized
    
    var tokenAddr = "Gh9ZwEmdLJ8DscKNTkTqPbNwLNNBjuSzaG9Vp2KGtKJr"
        
    var supplyInfo: ACSolanaTokenSupplyInfo?
    
    var gettingSupply = false
        
    let infoDesc = "Token Supply:"
    
    let eventDesc = "Get Token Supply"
}

@Observable
class TxDetailsModel {
    
    var commitment = ACSolanaRPCAPI.StateCommitment.confirmed
    var encoding = ACSolanaRPCAPI.encodingKind.json
    
    var txID = "5Pj5fCupXLUePYn18JkY8SrRaWFiUctuDTRwvUy2ML9yvkENLb1QMYbcBGcBXRrSVDjp7RjUwk9a3rLC6gpvtYpZ"
        
    var details: ACSolanaTxDetails?
    
    var gettingDetails = false
        
    let infoDesc = "Tx Details:"
    
    let eventDesc = "Get Tx Details"
}

@Observable
class TxCountModel {
    
    var gettingCount = false
    
    var count: UInt64 = .zero
    
    let infoDesc = "Tx Count:"
    
    let eventDesc = "Get Tx Count"
}

@Observable
class VersionModel {
    
    var version: ACSolanaNodeVersion?
    
    var gettingVersion = false
        
    let infoDesc = "Node Version:"
    
    let eventDesc = "Get Node Version"
}

@Observable
class VoteAccountsModel {
    
    var gettingVoteAccounts = false
    
    var accts: [ACSolanaVoteAccountInfo]?
     
    var votePubkey = "i7NyKBMJCA9bLM2nsGyAGCKHECuR2L5eh4GqFciuwNT"
    
    let infoDesc = "Vote Accounts:"
    
    let eventDesc = "Get Vote Accounts"
}

@Observable
class BlockhashValidModel {
        
    var checking = false
    
    var isValid = false
        
    var blockhash = "C8z4BLfkg7SxGJoNuhq421sCpBaj8HVQYA9RDBazdeYY"
    
    let infoDesc = "Is valid blockhash:"
    
    let eventDesc = "Check"
}

@Observable
class MinLedgerSlotModel {
        
    var gettingSlot = false
    
    var slot: UInt64 = 0
    
    let infoDesc = "Min Ledger Slot:"
    
    let eventDesc = "Get Min Ledger Slot"
}

@Observable
class AirdropRequestModel {
        
    var requesting = false
    
    var txHash: String?
    
    var acctAdress = "83astBRguLMdt2h5U1Tpdq5tjFoJ6noeGwaY3mDLVcri"
    
    let amount: UInt64 = 1000000000
    
    let infoDesc = "Airdrop for:"
    
    let eventDesc = "Request Airdrop"
}

@Observable
class SendTxModel {
        
    var sending = false
    
    var sentTx = "AbC/XNkPUUZ7/51SaG1wbG0ojrWHIGzVL73M8hRnDr73RkBAZc0ZnikluvcCeprAmqHDJrcPxPUbvEJMVBIiVQeAAQABAzfDSQC/GjcggrLsDpYz7jAlT+Gca846HqtFb8UQMM9cCWPIi4AX32PV8HrY7/1WgoRc3IATttceZsUMeQ1qx7UAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIgsVWEgMTiOYp63gTtuYGw+izfm6wKQdivpiXQBpNnYAQICAAEMAgAAAEBCDwAAAAAAAA=="
    
    var txSignature = "No signature"
        
    let infoDesc = "Tx:"
    
    let eventDesc = "Send Tx"
}

@Observable
class TxSimulationModel {
        
    var simulating = false
    
    var simulatioInfo: ACSolanasimulationTxInfo?
    
    var txHash = "AQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAEEjNmKiZGiOtSZ+g0//wH5kEQo3+UzictY+KlLV8hjXcs44M/Xnr+1SlZsqS6cFMQc46yj9PIsxqkycxJmXT+veJjIvefX4nhY9rY+B5qreeqTHu4mG6Xtxr5udn4MN8PnBt324e51j94YQl285GzN2rYa/E2DuQ0n/r35KNihi/zamQ6EeyeeVDvPVgUO2W3Lgt9hT+CfyqHvIa11egFPCgEDAwIBAAkDZAAAAAAAAAA="
            
    let infoDesc = "Tx:"
    
    let eventDesc = "Simulate Tx"
}

@Observable
class SolanaViewModel {
    var rpcAddr: String
    var acctAddr: String
    
    var solInteractor: ACSolanaInteractor
    
    var rpcInfoModel = RPCInfoModel()
    
    /// BlockBalanceModel.
    let balanceModel = BlockBalanceModel()
    
    /// AccountInfoModel.
    let acctInfoModel = AccountInfoModel()
    
    /// BlockInfoModel.
    let blockInfoModel = BlockInfoModel()
    
    /// BlockCommitmentModel.
    var blkCmmitMode = BlockCommitmentModel()
    
    /// CurrentBlockHeightModel.
    let curBlkHeightModel = CurrentBlockHeightModel()
    
    /// BlockProductionModel.
    let blkProdModel = BlockProductionModel()
    
    /// BlocksModel.
    let blocksModel = BlocksModel()
    
    /// LimitedBlocksModel.
    let limitedBlocksModel = LimitedBlocksModel()
    
    /// BlockTimeModel.
    let blockTimeModel = BlockTimeModel()
    
    /// ClusterNodesModel.
    let nodesModel = ClusterNodesModel()
    
    /// EpochInfoModel.
    let curEpochInfoModel = EpochInfoModel()
    
    /// EpochScheduleInfoModel.
    let epochScheduleInfoModel = EpochScheduleInfoModel()
    
    /// FeeForMessageModel.
    var feeForMessageModel = FeeForMessageModel()
    
    /// FirstAvailableBlockModel
    let firstAvailableBlockModel = FirstAvailableBlockModel()

    /// GenesisHashModel.
    let genesisHashModel = GenesisHashModel()
    
    /// HealthModel.
    let healthModel = HealthModel()
    
    /// HighestSnapshotSlotModel.
    let highestSlotModel = HighestSnapshotSlotModel()
    
    /// NodeIdentityModel.
    let nodeIdModel = NodeIdentityModel()
    
    /// InflationGovernorModel.
    let infGovernorModel = InflationGovernorModel()
    
    /// InflationRateModel.
    let infRateModel = InflationRateModel()
    
    /// InflationRewardModel.
    var infRewardModel = InflationRewardModel()
    
    /// LargestAccountsModel.
    let largAcctsModel = LargestAccountsModel()
    
    /// LatestBlockInfoModel.
    let latestBlkInfoModel = LatestBlockInfoModel()
    
    /// LeaderScheduleModel.
    let leaderScheduleModel = LeaderScheduleModel()
    
    /// MaxRetransmitSlotModel.
    let maxRetransmitSlotModel = MaxRetransmitSlotModel()
    
    /// MaxRetransmitSlotModel.
    let maxSharedInsertSlotModel = MaxShredInsertSlotModel()
    
    /// MinimumBalanceForRentExemptionModel.
    let minBalForRentExemptionModel = MinimumBalanceForRentExemptionModel()
    
    /// MultiAccountsInfoModel.
    let acctsInfoModel = MultiAccountsInfoModel()
    
    /// ProgramAccountsModel.
    let programAccountsModel = ProgramAccountsModel()
    
    /// RecentPerformanceSamplesModel.
    var performanceSamplesModel = RecentPerformanceSamplesModel()
    
    /// PrioritizationFeesModel.
    var prioriFeesModel = PrioritizationFeesModel()
    
    /// SignaturesForAddressModel.
    var signaturesModel = SignaturesForAddressModel()
    
    /// SignatureStatusesModel.
    var signatureStatusesModel = SignatureStatusesModel()
    
    /// SlotModel.
    let slotModel = SlotModel()
    
    /// SlotLeaderModel。
    let slotLeaderModel = SlotLeaderModel()
    
    /// SlotLeadersModel.
    var slotLeadersModel = SlotLeadersModel()
    
    /// StakeMinDelegationModel.
    let stakeMinDelegationModel = StakeMinDelegationModel()
    
    /// SupplyModel.
    var supplyModel = SupplyModel()
    
    /// TokenAccountBalanceModel.
    var tokenAcctBalanceModel = TokenAccountBalanceModel()
    
    /// TokenAccountsByDelegateModel.
    var tokenAcctsByDelegateModel = TokenAccountsByDelegateModel()
    
    /// TokenAccountsByOwnerModel.
    var tokenAcctsByOwnerModel = TokenAccountsByOwnerModel()
    
    /// TokenLargestAccountsModel.
    var tokenLargestAccountsModel = TokenLargestAccountsModel()
    
    /// TokenSupplyModel.
    var tokenSupplyModel = TokenSupplyModel()
    
    /// TxDetailsModel.
    var txDetailsModel = TxDetailsModel()
    
    /// TxCountModel.
    let txCountModel = TxCountModel()
    
    /// VersionModel.
    let versionModel = VersionModel()
    
    /// VoteAccountsModel
    var voteAccountsModel = VoteAccountsModel()
    
    /// BlockhashValidModel.
    var blockhashValidModel = BlockhashValidModel()
    
    /// MinLedgerSlotModel.
    let minLedgerSlotModel = MinLedgerSlotModel()
    
    /// AirdropRequestModel.
    var airdropRequestModel = AirdropRequestModel()
    
    /// SendTxModel.
    var sendTxModel = SendTxModel()
    
    /// TxSimulationModel.
    var txSimulationModel = TxSimulationModel()
    
    init(rpcAddr: String = "https://api.devnet.solana.com", acctAddr: String = "83astBRguLMdt2h5U1Tpdq5tjFoJ6noeGwaY3mDLVcri") {
        self.rpcAddr = rpcAddr
        self.acctAddr = acctAddr
        self.solInteractor = ACSolanaInteractor(rpcAddress: rpcAddr,
                                                requester: URLSessionRequester(), logger: ACConsoleLogger())
    }
    
    func getBalance() {
        Task {
            guard !balanceModel.gettingBalance else {
                return
            }
            balanceModel.gettingBalance = true
            do {
                let balance = try await solInteractor.getBalance(of: acctAddr, optionalParams: ACSolanaBasicOptionalParams(commitment: ACSolanaRPCAPI.StateCommitment.finalized, minContextSlot: 10), rpcAddress: rpcInfoModel.address)
                print("current balance:\(balance)")
                self.balanceModel.balance = balance
            } catch {
                if let acError = error as? ACError<Int, String> {
                    print(acError.description)
                } else {
                    print("getBalance failed with error:\(error)")
                }
                
            }
            balanceModel.gettingBalance = false
        }
    }
    
    func getAccountInfo() {
        Task {
            guard !acctInfoModel.gettingAcctInfo else {
                return
            }
            acctInfoModel.gettingAcctInfo = true
            do {
                let acctInfo = try await solInteractor.getAccountInfo(pubKey: acctAddr,
                                                                      optionalParams: ACSolanaAccountOptionalParams(commitment: ACSolanaRPCAPI.StateCommitment.finalized, encoding: ACSolanaRPCAPI.encodingKind.base58, dataSlice: ACSolanaDataSlice(length: 126, offset: 0), minContextSlot: 10), rpcAddress: rpcInfoModel.address)
                print("current account info:\(acctInfo)")
                acctInfoModel.acctInfo = acctInfo
            } catch {
                print("getAccountInfo failed with error: \(error)")
            }
            acctInfoModel.gettingAcctInfo = false
        }
    }
    
    func getBlock() {
        Task {
            guard !blockInfoModel.gettingBlkInfo else {
                return
            }
            guard let slotNum = UInt64(blockInfoModel.slotNumStr) else {
                print("Failed to convert num string :\(blockInfoModel.slotNumStr) to UInt64")
                return
            }
            blockInfoModel.gettingBlkInfo = true
            do {
                // set maxSupportedTransactionVersion, otherwise any versioned transaction will result in an error.
                let optionalParams = ACSolanaGetBlock.OptionalParams(commitment: ACSolanaRPCAPI.StateCommitment.finalized,
                                                                     encoding: ACSolanaRPCAPI.encodingKind.base58,
                                                                     transactionDetails: ACSolanaRPCAPI.TxDetail.full.rawValue,
                                                                     maxSupportedTransactionVersion: ACSolanaRPCAPI.maxSupportedTransactionVersion, rewards: true)
                let blockInfo = try await solInteractor.getBlock(by: slotNum,
                                                                 optionalParams: optionalParams, rpcAddress: rpcInfoModel.address)
                print("slot:\(blockInfoModel.slotNumStr)'s blockInfo \(blockInfo)")
                blockInfoModel.blockInfo = blockInfo
            } catch {
                print("getBlock failed with error \(error)")
            }
            blockInfoModel.gettingBlkInfo = false
        }
    }
    
    func getBlockCommitment() {
        Task {
            guard !blkCmmitMode.gettingBlkCommit else {
                return
            }
            let blkHeightStr = blkCmmitMode.blockHeightStr
            guard let blkHeight = UInt64(blkHeightStr) else {
                print("Failed to convert num string :\(blkHeightStr) to UInt64")
                return
            }
            blkCmmitMode.gettingBlkCommit = true
            do {
                let commitments = try await  solInteractor.getBlockCommitment(blockHeight: blkHeight, rpcAddress: rpcInfoModel.address)
                blkCmmitMode.commitments = commitments
            } catch {
                print("getBlockCommitment failed with error:\(error)")
            }
            blkCmmitMode.gettingBlkCommit = false
        }
    }
    
    func getCurrentBlockHeight() {
        Task {
            guard !curBlkHeightModel.gettingBlkHeight else {
                return
            }
            curBlkHeightModel.gettingBlkHeight = true
            do {
                let curBlkHeight = try await solInteractor.getCurrentBlockHeight(optionalParams: ACSolanaBasicOptionalParams(commitment: ACSolanaRPCAPI.StateCommitment.finalized,
                                                                                                                             minContextSlot: 0), rpcAddress: rpcInfoModel.address)
                curBlkHeightModel.curBlkHeight = curBlkHeight
                print("current block height is \(curBlkHeight)")
            } catch {
                print("getCurrentBlockHeight failed with error:\(error)")
            }
            curBlkHeightModel.gettingBlkHeight = false
        }
    }
    
    func getBlockProduction() {
        Task {
            guard !blkProdModel.gettingBlkProd else {
                return
            }
            blkProdModel.gettingBlkProd = true
            do {
                let production = try await solInteractor.getBlockProduction(optionalParams: ACSolanaGetBlockProduction.OptionalParams(commitment: ACSolanaRPCAPI.StateCommitment.finalized,
                                                                                                                                      range: ACSolanaSlotRange(firstSlot: blkProdModel.firstSlot)), rpcAddress: rpcInfoModel.address)
                blkProdModel.production = production
                print("block production is \(production)")
            } catch {
                print("getBlockProduction failed with error:\(error)")
            }
            blkProdModel.gettingBlkProd = false
        }
    }
    
    func getBlocks() {
        Task {
            guard !blocksModel.gettingBlocks else {
                return
            }
            blocksModel.gettingBlocks = true
            do {
//                let blocks = try await solInteractor.getBlocks(slotRange: ACSolanaSlotRange(firstSlot: blocksModel.startSlot, lastSlot: blocksModel.endSlot), optionalParams: ACSolanaGetBlocks.OptionalParams(commitment: ACSolanaRPCAPI.StateCommitment.finalized))
                let blocks = try await solInteractor.getBlocks(slotRange: ACSolanaSlotRange(firstSlot: blocksModel.startSlot, lastSlot: blocksModel.endSlot), optionalParams: ACSolanaGetBlocks.OptionalParams(), rpcAddress: rpcInfoModel.address)
                blocksModel.blocks = blocks
                print("blocks is \(blocks)")
            } catch {
                print("getBlockss failed with error:\(error)")
            }
            blocksModel.gettingBlocks = false
        }
    }
    
    func getLimitdBlocks() {
        Task {
            guard !limitedBlocksModel.gettingBlocks else {
                return
            }
            limitedBlocksModel.gettingBlocks = true
            do {
                let blocks = try await solInteractor.getLimitBlocks(limitRange: ACSolanaLimitedSlotRange(startSlot: limitedBlocksModel.startSlot, limit: limitedBlocksModel.limit), optionalParams: ACSolanaGetBlocks.OptionalParams(commitment: .confirmed), rpcAddress: rpcInfoModel.address)
                limitedBlocksModel.blocks = blocks
                print("blocks is \(blocks)")
            } catch {
                print("getBlocksWithLimit failed with error:\(error)")
            }
            limitedBlocksModel.gettingBlocks = false
        }
    }
    
    
    func getBlockTime() {
        Task {
            guard !blockTimeModel.gettingBlkTime else {
                return
            }
            limitedBlocksModel.gettingBlocks = true
            do {
                let blockTime = try await solInteractor.getBlockTime(of : blockTimeModel.blockHeight, rpcAddress: rpcInfoModel.address)
                blockTimeModel.blockTime = blockTime
                print("block time is \(blockTime)")
            } catch {
                print("getBlockTime failed with error:\(error)")
            }
            limitedBlocksModel.gettingBlocks = false
        }
    }
    
    func getClusterNodes() {
        Task {
            guard !nodesModel.gettingNodes else {
                return
            }
            nodesModel.gettingNodes  = true
            do {
                let nodes = try await solInteractor.getClusterNodes(rpcAddress: rpcInfoModel.address)
                nodesModel.nodes = nodes
                print("block time is \(nodes)")
            } catch {
                print("getClusterNodes failed with error:\(error)")
            }
            nodesModel.gettingNodes = false
        }
    }
    
    func getCurEpochInfo() {
        Task {
            guard !curEpochInfoModel.gettingEpochInfo else {
                return
            }
            curEpochInfoModel.gettingEpochInfo = true
            do {
                let epochInfo = try await solInteractor.getCurrentEpochInfo(optionalParams: ACSolanaBasicOptionalParams(commitment: ACSolanaRPCAPI.StateCommitment.finalized, minContextSlot: 10), rpcAddress: rpcInfoModel.address)
                curEpochInfoModel.epochInfo = epochInfo
                print("current epoch info is \(epochInfo)")
            } catch {
                print("getCurEpochInfo failed with error:\(error)")
            }
            curEpochInfoModel.gettingEpochInfo  = false
        }
    }
    
    func getEpochScheduleInfo() {
        Task {
            guard !epochScheduleInfoModel.gettingEpochScheduleInfo else {
                return
            }
            epochScheduleInfoModel.gettingEpochScheduleInfo = true
            do {
                let epochScheduleInfo = try await solInteractor.getEpochScheduleInfo(rpcAddress: rpcInfoModel.address)
                epochScheduleInfoModel.epochScheduleInfo = epochScheduleInfo
                print("current epoch info is \(epochScheduleInfo)")
            } catch {
                print("getEpochScheduleInfo failed with error:\(error)")
            }
            epochScheduleInfoModel.gettingEpochScheduleInfo  = false
        }
    }
    
    func getFeeForMessage() {
        Task {
            guard !feeForMessageModel.gettingFeeForMessag else {
                return
            }
            feeForMessageModel.gettingFeeForMessag = true
            do {
                let feeForMessage = try await solInteractor.getFeeForMessage(base64Msg: feeForMessageModel.message, optionalParams: ACSolanaBasicOptionalParams(commitment: ACSolanaRPCAPI.StateCommitment.finalized, minContextSlot: 10), rpcAddress: rpcInfoModel.address)
                print("Fee for message:\(feeForMessageModel.message) is \(feeForMessage ?? 0)")
            } catch {
                print("getFeeForMessage failed with error:\(error)")
            }
            feeForMessageModel.gettingFeeForMessag  = false
        }
    }
    
    func getFirstAvailableBlock() {
        Task {
            guard !firstAvailableBlockModel.gettingFirstAvailableBlock else {
                return
            }
            firstAvailableBlockModel.gettingFirstAvailableBlock = true
            do {
                let slot = try await solInteractor.getFirstAvailableBlock(rpcAddress: rpcInfoModel.address)
                firstAvailableBlockModel.slot = slot
                print("first available block is: \(slot ?? 0)")
            } catch {
                print("getFirstAvailableBlock failed with error:\(error)")
            }
            firstAvailableBlockModel.gettingFirstAvailableBlock = false
        }
    }
    
    func getGenesisHash() {
        Task {
            guard !genesisHashModel.gettingGenesisHash else {
                return
            }
            genesisHashModel.gettingGenesisHash = true
            do {
                let genesisHash = try await solInteractor.getGenesisHash(rpcAddress: rpcInfoModel.address)
                genesisHashModel.genesisHash = genesisHash
                print("genesis hash is: \(genesisHash)")
            } catch {
                print("getGenesisHash failed with error:\(error)")
            }
            genesisHashModel.gettingGenesisHash = false
        }
    }
    
    func getHealth() {
        Task {
            guard !healthModel.gettingHealth else {
                return
            }
            healthModel.gettingHealth = true
            do {
                let health = try await solInteractor.getHealth(rpcAddress: rpcInfoModel.address)
                healthModel.healthStatus = health
                print("health status is: \(health)")
            } catch {
                print("getHealth failed with error:\(error)")
            }
            healthModel.gettingHealth = false
        }
    }
    
    func getHighestSnapshotSlot() {
        Task {
            guard !highestSlotModel.gettingSlot else {
                return
            }
            highestSlotModel.gettingSlot = true
            do {
                let slotInfo = try await solInteractor.getHighestSnapshotSlot(rpcAddress: rpcInfoModel.address)
                highestSlotModel.slotInfo = slotInfo
                print("Highest Snapshot Slot is: \(slotInfo)")
            } catch {
                print("getHighestSnapshotSlot failed with error:\(error)")
            }
            highestSlotModel.gettingSlot = false
        }
    }
    
    func getNodeIdentity() {
        Task {
            guard !nodeIdModel.gettingIdentity else {
                return
            }
            nodeIdModel.gettingIdentity = true
            do {
                let nodeIdentity = try await solInteractor.getIdentity(rpcAddress: rpcInfoModel.address)
                nodeIdModel.nodeIdentity = nodeIdentity
                print("node identity is: \(nodeIdentity)")
            } catch {
                print("getNodeIdentity failed with error:\(error)")
            }
            nodeIdModel.gettingIdentity = false
        }
    }
    
    func getInflationGovernor() {
        Task {
            guard !infGovernorModel.gettingGovernor else {
                return
            }
            infGovernorModel.gettingGovernor = true
            do {
                let governor = try await solInteractor.getInflationGovernor(optionalParams: ACSolanaGetInflationGovernor.OptionalParams(commitment: .confirmed), rpcAddress: rpcInfoModel.address)
                infGovernorModel.governor = governor
                print("Inflation governor is: \(governor)")
            } catch {
                print("getInflationGovernor failed with error:\(error)")
            }
            infGovernorModel.gettingGovernor = false
        }
    }
    
    func getInflationRate() {
        Task {
            guard !infRateModel.gettingRate else {
                return
            }
            infRateModel.gettingRate = true
            do {
                let rate = try await solInteractor.getInflationRate(rpcAddress: rpcInfoModel.address)
                infRateModel.rate = rate
                print("Inflation rate is: \(rate)")
            } catch {
                print("getInflationRate failed with error:\(error)")
            }
            infRateModel.gettingRate = false
        }
    }
    
    func getInflationReward() {
        Task {
            guard !infRewardModel.gettingReward else {
                return
            }
            infRewardModel.gettingReward = true
            do {
                let rewards = try await solInteractor.getInflationReward(of: infRewardModel.addresses,
                                                                         optionalParams: ACSolanaGetInflationReward.OptionalParams(commitment: .confirmed, epoch: infRewardModel.epoch), rpcAddress: rpcInfoModel.address)
                infRewardModel.rewards = rewards
                print("Inflation reward is: \(rewards)")
            } catch {
                print("getInflationReward failed with error:\(error)")
            }
            infRewardModel.gettingReward = false
        }
    }
    
    func getLargestAccounts() {
        Task {
            guard !largAcctsModel.gettingAccounts else {
                return
            }
            largAcctsModel.gettingAccounts = true
            do {
                let acctInfo = try await solInteractor.getLargestAccounts(optionalParams: ACSolanaGetLargestAccounts.OptionalParams(commitment: .confirmed, filter: .circulating), rpcAddress: rpcInfoModel.address)
                largAcctsModel.acctInfo = acctInfo
                print("Largest Accounts is: \(acctInfo)")
            } catch {
                print("getLargestAccounts failed with error:\(error)")
            }
            largAcctsModel.gettingAccounts = false
        }
    }
    
    func getLatestBlockInfo() {
        Task {
            guard !latestBlkInfoModel.gettingBlkInfo else {
                return
            }
            latestBlkInfoModel.gettingBlkInfo = true
            do {
                let blkInfo = try await solInteractor.getLatestBlockInfo(optionalParams: ACSolanaBasicOptionalParams(commitment: .confirmed, minContextSlot: 10), rpcAddress: rpcInfoModel.address)
                latestBlkInfoModel.blkInfo = blkInfo
                print("Latest block info is: \(blkInfo)")
            } catch {
                print("getLatestBlockInfo failed with error:\(error)")
            }
            latestBlkInfoModel.gettingBlkInfo = false
        }
    }
    
    func getLeaderSchedule() {
        Task {
            guard !leaderScheduleModel.gettingSchedule else {
                return
            }
            leaderScheduleModel.gettingSchedule = true
            do {
                let schedule = try await solInteractor.getLeaderSchedule(optionalParams: ACSolanaGetLeaderSchedule.OptionalParams(commitment: .processed, identity: "dv2eQHeP4RFrJZ6UeiZWoc3XTtmtZCUKxxCApCDcRNV"), rpcAddress: rpcInfoModel.address)
                leaderScheduleModel.schedule = schedule
                print("Leader schedule get succeed")
            } catch {
                print("getLeaderScheduleModel failed with error:\(error)")
            }
            leaderScheduleModel.gettingSchedule = false
        }
    }
    
    func getMaxRetransmitSlot() {
        Task {
            guard !maxRetransmitSlotModel.gettingSlot else {
                return
            }
            maxRetransmitSlotModel.gettingSlot = true
            do {
                let slot = try await solInteractor.getMaxRetransmitSlot(rpcAddress: rpcInfoModel.address)
                maxRetransmitSlotModel.slot = slot
                print("Max retransmit slot is:\(slot)")
            } catch {
                print("getMaxRetransmitSlot failed with error:\(error)")
            }
            maxRetransmitSlotModel.gettingSlot = false
        }
    }
    
    func getMaxShredInsertSlot() {
        Task {
            guard !maxSharedInsertSlotModel.gettingSlot else {
                return
            }
            maxSharedInsertSlotModel.gettingSlot = true
            do {
                let slot = try await solInteractor.getMaxShredInsertSlot(rpcAddress: rpcInfoModel.address)
                maxSharedInsertSlotModel.slot = slot
                print("Max shared insert slot is:\(slot)")
            } catch {
                print("getMaxShredInsertSlot failed with error:\(error)")
            }
            maxSharedInsertSlotModel.gettingSlot = false
        }
    }
    
    func getMinmBalanceForRentExemption() {
        Task {
            guard !minBalForRentExemptionModel.gettingBalance else {
                return
            }
            minBalForRentExemptionModel.gettingBalance = true
            do {
                let dataLength = minBalForRentExemptionModel.accountDataLength
                let balance = try await solInteractor.getMinimumBalanceForRentExemption(accountDataLength: dataLength, optionalParams: MinBalanceForRentExemptionOptParams(commitment: .confirmed), rpcAddress: rpcInfoModel.address)
                minBalForRentExemptionModel.balance = balance
                print("Min balance for rent exemption is:\(balance)")
            } catch {
                print("getMinmBalanceForRentExemption failed with error:\(error)")
            }
            minBalForRentExemptionModel.gettingBalance = false
        }
    }
    
    func getMultipleAccountsInfo() {
        Task {
            guard !acctsInfoModel.gettingAcctsInfo else {
                return
            }
            acctsInfoModel.gettingAcctsInfo = true
            do {
                let acctsInfo = try await solInteractor.getMultipleAccounts(pubKeys: acctsInfoModel.pubKeys,
                                                                            optionalParams: ACSolanaAccountOptionalParams(commitment: ACSolanaRPCAPI.StateCommitment.finalized, encoding: ACSolanaRPCAPI.encodingKind.base58, dataSlice: ACSolanaDataSlice(length: 126, offset: 0), minContextSlot: 10), rpcAddress: rpcInfoModel.address)
                print("Multiple account info:\(acctsInfo)")
                acctsInfoModel.acctsInfo = acctsInfo
            } catch {
                print("getAccountsInfo failed with error: \(error)")
            }
            acctsInfoModel.gettingAcctsInfo = false
        }
    }
    
    func getProgramAccounts() {
        Task {
            guard !programAccountsModel.gettingAcctsInfo else {
                return
            }
            programAccountsModel.gettingAcctsInfo = true
            do {
                let acctsInfo = try await solInteractor.getProgramAccounts(pubKey: programAccountsModel.pubkey, optionalParams: ACSolanaGetProgramAccounts.OptionalParams(commitment: ACSolanaRPCAPI.StateCommitment.finalized, withContext: true, encoding: ACSolanaRPCAPI.encodingKind.jsonParsed), rpcAddress: rpcInfoModel.address)
                print("Program accounts info:\(String(describing: acctsInfo.first))")
                programAccountsModel.acctsInfo = acctsInfo
            } catch {
                print("getProgramAccounts failed with error: \(error)")
            }
            programAccountsModel.gettingAcctsInfo = false
        }
    }
    
    func getRecentPerformanceSamples() {
        Task {
            guard !performanceSamplesModel.gettingSamples else {
                return
            }
            performanceSamplesModel.gettingSamples = true
            do {
                let samples = try await solInteractor.getRecentPerformanceSamples(sampleNum: performanceSamplesModel.sampleNum, rpcAddress: rpcInfoModel.address)
                print("Performance Samples :\(String(describing: samples))")
                performanceSamplesModel.samples = samples
            } catch {
                print("getRecentPerformanceSamples failed with error: \(error)")
            }
            performanceSamplesModel.gettingSamples = false
        }
    }
    
    func getRecentPrioritizationFees() {
        Task {
            guard !prioriFeesModel.gettingFees else {
                return
            }
            prioriFeesModel.gettingFees = true
            do {
                var addresses: [String]? = nil
                if !prioriFeesModel.acctAddr.isEmpty {
                    addresses = [prioriFeesModel.acctAddr]
                }
                let feesInfo = try await solInteractor.getRecentPrioritizationFees(addresses: addresses, rpcAddress: rpcInfoModel.address)
                print("FeesInfo :\(String(describing: feesInfo))")
                prioriFeesModel.feesInfo = feesInfo
            } catch {
                print("getRecentPrioritizationFees failed with error: \(error)")
            }
            prioriFeesModel.gettingFees = false
        }
    }
    
    func getSignaturesForAddress() {
        Task {
            guard !signaturesModel.gettingSignatures else {
                return
            }
            signaturesModel.gettingSignatures = true
            do {
                let signatures = try await solInteractor.getSignatures(forAddress: signaturesModel.address, optionalParams: ACSolanaGetSignaturesForAddress.OptionalParams(commitment: .finalized, limit: 5, before: "3GPLVxrf1qnjnC3WCtPc9uNgB5xtdWqCpp4WDSkCXFxrtyAMjGvuizbHwTnw1xfvp128275pkxC9MbTwDGRS9PsF"), rpcAddress: rpcInfoModel.address)
                print("Address:\(signaturesModel.address)'s signatures:\(signatures)")
                signaturesModel.signatures = signatures
            } catch {
                print("getSignaturesForAddress failed with error: \(error)")
            }
            signaturesModel.gettingSignatures = false
        }
    }
    
    func getSignatureStatuses() {
        Task {
            guard !signatureStatusesModel.gettingStatuses else {
                return
            }
            signatureStatusesModel.gettingStatuses = true
            do {
                let statuses = try await solInteractor.getSignatureStatuses(signatures: [signatureStatusesModel.signature, "5VERv8NMvzbJMEkV8xnrLkEaWRtSz9CosKDYjCJjBRnbJLgp8uirBgmQpjKhoR4tjF3ZpRzrFmBV6UjKdiSZkQUW"], isSearchTxHistory: true, rpcAddress: rpcInfoModel.address)
                print("signatures status:\(statuses)")
                signatureStatusesModel.statuses = statuses
            } catch {
                print("getSignatureStatuses failed with error: \(error)")
            }
            signatureStatusesModel.gettingStatuses = false
        }
    }
    
    func getSlot() {
        Task {
            guard !slotModel.gettingSlot else {
                return
            }
            slotModel.gettingSlot = true
            do {
                let slot = try await solInteractor.getSlot(optionalParams: ACSolanaBasicOptionalParams(commitment: .processed), rpcAddress: rpcInfoModel.address)
                print("slot:\(slot)")
                slotModel.slot = slot
            } catch {
                print("getSlot failed with error: \(error)")
            }
            slotModel.gettingSlot = false
        }
    }
    
    func getSlotLeader() {
        Task {
            guard !slotLeaderModel.gettingSlotLeader else {
                return
            }
            slotLeaderModel.gettingSlotLeader = true
            do {
                let slotLeader = try await solInteractor.getSlotLeader(optionalParams: ACSolanaBasicOptionalParams(commitment: .processed, minContextSlot: 10), rpcAddress: rpcInfoModel.address)
                print("slot leader:\(slotLeader)")
                slotLeaderModel.slotleader = slotLeader
            } catch {
                print("getSlotLeader failed with error: \(error)")
            }
            slotLeaderModel.gettingSlotLeader = false
        }
    }
    
    func getSlotLeaders() {
        Task {
            guard !slotLeadersModel.gettingSlotLeaders else {
                return
            }
            slotLeadersModel.gettingSlotLeaders = true
            do {
                let slotleaders = try await solInteractor.getSlotLeaders(startSlot: slotLeadersModel.startSlot,
                                                                         limit: slotLeadersModel.limit, rpcAddress: rpcInfoModel.address)
                print("slot leaders:\(slotleaders)")
                slotLeadersModel.slotleaders = slotleaders
            } catch {
                print("getSlotLeaders failed with error: \(error)")
            }
            slotLeadersModel.gettingSlotLeaders = false
        }
    }
    
    func getStakeMinimumDelegation() {
        Task {
            guard !stakeMinDelegationModel.gettingelegation else {
                return
            }
            stakeMinDelegationModel.gettingelegation = true
            do {
                let minDelegation = try await solInteractor.getStakeMinimumDelegation(commitment: .confirmed, rpcAddress: rpcInfoModel.address)
                print("Stake min Delegation:\(minDelegation)")
                stakeMinDelegationModel.minDelegation = minDelegation
            } catch {
                print("getStakeMinimumDelegation failed with error: \(error)")
            }
            stakeMinDelegationModel.gettingelegation = false
        }
    }
    
    func getSupply() {
        Task {
            guard !supplyModel.gettingSupply else {
                return
            }
            supplyModel.gettingSupply = true
            do {
                let supplyInfo = try await solInteractor.getSupply(optionalParams: ACSolanaGetSupply.OptionalParams(commitment: .finalized, excludeNonCirculatingAccountsList: true), rpcAddress: rpcInfoModel.address)
                print("supply:\(supplyInfo)")
                supplyModel.supplyInfo = supplyInfo
            } catch {
                print("getSupply failed with error: \(error)")
            }
            supplyModel.gettingSupply = false
        }
    }
    
    func getTokenAccountBalance() {
        Task {
            guard !tokenAcctBalanceModel.gettingBalance else {
                return
            }
            tokenAcctBalanceModel.gettingBalance = true
            do {
                let tokenAcctBalance = try await solInteractor.getTokenAccountBalance(pubKey: tokenAcctBalanceModel.tokenAcct, commitment: .finalized, rpcAddress: rpcInfoModel.address)
                print("token Account balance:\(tokenAcctBalance)")
                tokenAcctBalanceModel.balance = tokenAcctBalance
            } catch {
                print("getTokenAccountBalance failed with error: \(error)")
            }
            tokenAcctBalanceModel.gettingBalance = false
        }
    }
    
    func getTokenAccountsByDelegate() {
        Task {
            guard !tokenAcctsByDelegateModel.gettingAccounts else {
                return
            }
            tokenAcctsByDelegateModel.gettingAccounts = true
            do {
                let accts = try await solInteractor.getTokenAccountsByDelegate(delegateAcct: tokenAcctsByDelegateModel.delegate, ownershipParams: ACSolanaTokenAccountOwnershipParams(programId: tokenAcctsByDelegateModel.programId), optionalParams: ACSolanaAccountOptionalParams(encoding: ACSolanaRPCAPI.encodingKind.jsonParsed), rpcAddress: rpcInfoModel.address)
                print("token accounts by delegate:\(accts)")
                tokenAcctsByDelegateModel.accts = accts
            } catch {
                print("getTokenAccountsByDelegate failed with error: \(error)")
            }
            tokenAcctsByDelegateModel.gettingAccounts = false
        }
    }
    
    func getTokenAccountsByOwner() {
        Task {
            guard !tokenAcctsByOwnerModel.gettingAccounts else {
                return
            }
            tokenAcctsByOwnerModel.gettingAccounts = true
            do {
                let accts = try await solInteractor.getTokenAccountsByOwner(owner: tokenAcctsByOwnerModel.owner, ownershipParams: ACSolanaTokenAccountOwnershipParams(programId: tokenAcctsByOwnerModel.programId), optionalParams: ACSolanaAccountOptionalParams(encoding: ACSolanaRPCAPI.encodingKind.jsonParsed), rpcAddress: rpcInfoModel.address)
                print("token accounts by owner:\(accts)")
                tokenAcctsByOwnerModel.accts = accts
            } catch {
                print("getTokenAccountsByOwner failed with error: \(error)")
            }
            tokenAcctsByOwnerModel.gettingAccounts = false
        }
    }
    
    func getTokenLargestAccounts() {
        Task {
            guard !tokenLargestAccountsModel.gettingAccounts else {
                return
            }
            tokenLargestAccountsModel.gettingAccounts = true
            do {
                let acctsInfo = try await solInteractor.getTokenLargestAccounts(tokenAddr: tokenLargestAccountsModel.tokenAddr, commitment: tokenLargestAccountsModel.commitment, rpcAddress: rpcInfoModel.address)
                print("Token Largest Accounts:\(acctsInfo)")
                tokenLargestAccountsModel.acctsInfo = acctsInfo
            } catch {
                print("getTokenLargestAccounts failed with error: \(error)")
            }
            tokenLargestAccountsModel.gettingAccounts = false
        }
    }
    
    func getTokenSupply() {
        Task {
            guard !tokenSupplyModel.gettingSupply else {
                return
            }
            tokenSupplyModel.gettingSupply = true
            do {
                let supplyInfo = try await solInteractor.getTokenSupply(tokenAddr: tokenSupplyModel.tokenAddr, commitment: tokenLargestAccountsModel.commitment, rpcAddress: rpcInfoModel.address)
                print("Token supply info:\(supplyInfo)")
                tokenSupplyModel.supplyInfo = supplyInfo
            } catch {
                print("getTokenSupply failed with error: \(error)")
            }
            tokenSupplyModel.gettingSupply = false
        }
    }
    
    func getTransaction() {
        Task {
            guard !txDetailsModel.gettingDetails else {
                return
            }
            txDetailsModel.gettingDetails = true
            do {
                let txDetails = try await solInteractor.getTransaction(txID: txDetailsModel.txID, optionalParams: ACSolanaGetTransaction.OptionalParams(commitment: txDetailsModel.commitment, encoding: txDetailsModel.encoding), rpcAddress: rpcInfoModel.address)
                print("Tx Details:\(txDetails)")
                txDetailsModel.details = txDetails
            } catch {
                print("getTransaction failed with error: \(error)")
            }
            txDetailsModel.gettingDetails = false
        }
    }
    
    func getTxCount() {
        Task {
            guard !txCountModel.gettingCount else {
                return
            }
            txDetailsModel.gettingDetails = true
            do {
                let count = try await solInteractor.getTransactionCount(rpcAddress: rpcInfoModel.address)
                print("Tx count:\(count)")
                txCountModel.count = count
            } catch {
                print("getTxCount failed with error: \(error)")
            }
            txDetailsModel.gettingDetails = false
        }
    }
    
    func getVersion() {
        Task {
            guard !versionModel.gettingVersion else {
                return
            }
            versionModel.gettingVersion = true
            do {
                let version = try await solInteractor.getVersion(rpcAddress: rpcInfoModel.address)
                print("version:\(version)")
                versionModel.version = version
            } catch {
                print("getVersion failed with error: \(error)")
            }
            versionModel.gettingVersion = false
        }
    }
    
    func getVoteAccounts() {
        Task {
            guard !voteAccountsModel.gettingVoteAccounts else {
                return
            }
            voteAccountsModel.gettingVoteAccounts = true
            do {
                let accts = try await solInteractor.getVoteAccounts(optionalParams: ACSolanaGetVoteAccounts.OptionalParams(commitment: ACSolanaRPCAPI.StateCommitment.finalized, votePubkey: voteAccountsModel.votePubkey, keepUnstakedDelinquents: true, delinquentSlotDistance: 100), rpcAddress: rpcInfoModel.address)
                print("vote accounts:\(accts)")
                voteAccountsModel.accts = accts
            } catch {
                print("getVoteAccounts failed with error: \(error)")
            }
            voteAccountsModel.gettingVoteAccounts = false
        }
    }
        
    func checkIsBlockhashValid() {
        Task {
            guard !blockhashValidModel.checking else {
                return
            }
            blockhashValidModel.checking = true
            do {
                let isValid = try await solInteractor.checkIsBlockhashValid(blockhash: blockhashValidModel.blockhash, rpcAddress: rpcInfoModel.address)
                print("blockhash is valid:\(isValid)")
                blockhashValidModel.isValid = isValid
            } catch {
                print("getVoteAccounts failed with error: \(error)")
            }
            blockhashValidModel.checking = false
        }
    }
    
    func getMinLedgerSlot() {
        Task {
            guard !minLedgerSlotModel.gettingSlot else {
                return
            }
            minLedgerSlotModel.gettingSlot = true
            do {
                let slot = try await solInteractor.getMinimumLedgerSlot(rpcAddress: rpcInfoModel.address)
                print("min ledger slot:\(slot)")
                minLedgerSlotModel.slot = slot
            } catch {
                print("getMinLedgerSlot failed with error: \(error)")
            }
            minLedgerSlotModel.gettingSlot = false
        }
    }
    
    func requestAirdrop() {
        Task {
            guard !airdropRequestModel.requesting else {
                return
            }
            airdropRequestModel.requesting = true
            do {
                let txHash = try await solInteractor.requestAirdrop(accountAddress: airdropRequestModel.acctAdress,
                                                                    amount: airdropRequestModel.amount, commitment: .confirmed, rpcAddress: rpcInfoModel.address)
                print("airdrop tx hash:\(txHash)")
                airdropRequestModel.txHash = txHash
            } catch {
                print("getMinLedgerSlot failed with error: \(error)")
            }
            airdropRequestModel.requesting = false
        }
    }
    
    func sendTx() {
        Task {
            guard !sendTxModel.sending else {
                return
            }
            sendTxModel.sending = true
            do {
                let txSignature = try await solInteractor.sendTransaction(txHash: sendTxModel.sentTx, optionalParams: ACSolanaSendTransaction.OptionalParams(encoding: .base64), rpcAddress: rpcInfoModel.address)
                print("succeed tx signature:\(txSignature)")
                sendTxModel.txSignature = txSignature
            } catch {
                print("sendTx failed with error: \(error)")
            }
            sendTxModel.sending = false
        }
    }
    
    func simulateTx() {
        Task {
            guard !txSimulationModel.simulating else {
                return
            }
            txSimulationModel.simulating = true
            do {
                let simulatioInfo = try await solInteractor.simulateTransaction(txHash: txSimulationModel.txHash, optionalParams: ACSolanaSimulateTransaction.OptionalParams(encoding: .base64, replaceRecentBlockhash: true, innerInstructions: true), rpcAddress: rpcInfoModel.address)
                print("Tx simulation info:\(simulatioInfo)")
                txSimulationModel.simulatioInfo = simulatioInfo
            } catch {
                print("simulateTx failed with error: \(error)")
            }
            txSimulationModel.simulating = false
        }
    }
}


struct SolanaRPCAPIView: View {
    @State var solVM = SolanaViewModel()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Solana RPC Methods").font(.system(size: 26)).bold()
            
            HStack {
                Text("RPC addr:")
                // Address
                ACTextField(solVM.rpcInfoModel.address,
                            text: $solVM.rpcInfoModel.address)
            }.padding()
            
            Divider()
            HStack {
                Text("Address:")
                // Address
                ACTextField(solVM.acctAddr, text: $solVM.acctAddr)
            }.padding()
            
            Divider()

            // GetBalance
            BalanceInfoView(balanceModel: solVM.balanceModel) {
                solVM.getBalance()
            }

            
            Divider()
            
            // GetAccountInfo
            SolInfoView(desc: solVM.acctInfoModel.infoDesc, content: solVM.acctInfoModel.acctInfoStr, eventDesc: solVM.acctInfoModel.eventDesc) {
                solVM.getAccountInfo()
            }
            
            Divider()
            
            // GetBlock part.
            BlockInfoView(blockInfoModel: solVM.blockInfoModel) {
                solVM.getBlock()
            }
            
            Divider()
            
            // BlockCommitmentView.
            
            SolInfoView(desc: solVM.blkCmmitMode.infoDesc,
                        editableDesc: $solVM.blkCmmitMode.blockHeightStr,
                        content: solVM.blkCmmitMode.commitmentDesc, eventDesc: solVM.blkCmmitMode.eventDesc) {
                solVM.getBlockCommitment()
            }
            
            Divider()
            
            // Current Block Height
            SolInfoView(desc: solVM.curBlkHeightModel.infoDesc, content: solVM.curBlkHeightModel.curBlkHeightStr, eventDesc: solVM.curBlkHeightModel.eventDesc) {
                solVM.getCurrentBlockHeight()
            }
            
            Divider()
            
            // Get block production
            SolInfoView(desc: solVM.blkProdModel.infoDesc, content: solVM.blkProdModel.productionStr, eventDesc: solVM.blkProdModel.eventDesc) {
                solVM.getBlockProduction()
            }
            
            Divider()
            
            // Get blocks.
            BlocksView(blocksModel: solVM.blocksModel) {
                solVM.getBlocks()
            }
            
            Divider()
            
            // LimitedBlocksView
            LimitedBlocksView(blocksModel: solVM.limitedBlocksModel) {
                solVM.getLimitdBlocks()
            }
            
            Divider()
            // BlockTimeView
            BlockTimeView(blockTimeModel: solVM.blockTimeModel) {
                solVM.getBlockTime()
            }
            
            Divider()
            /// ClusterNodesView.
            SolInfoView(desc: solVM.nodesModel.infoDesc, content: "\(solVM.nodesModel.nodes)", eventDesc: solVM.nodesModel.eventDesc) {
                solVM.getClusterNodes()
            }
            
            Divider()
            // CurrentEpochInfoView
            SolInfoView(desc: solVM.curEpochInfoModel.infoDesc, content: solVM.curEpochInfoModel.epochInfoStr, eventDesc: solVM.curEpochInfoModel.eventDesc) {
                solVM.getCurEpochInfo()
            }
            
            Divider()
            // EpochScheduleInfoView.
            SolInfoView(desc: solVM.epochScheduleInfoModel.infoDesc, content: solVM.epochScheduleInfoModel.epochScheduleInfoStr, eventDesc: solVM.epochScheduleInfoModel.eventDesc) {
                solVM.getEpochScheduleInfo()
            }
            
            Divider()
            // FeeForMessageView.
            SolInfoView(desc: solVM.feeForMessageModel.infoDesc,
                        editableDesc: $solVM.feeForMessageModel.message,
                        content: solVM.feeForMessageModel.feeStr,
                        eventDesc: solVM.feeForMessageModel.eventDesc) {
                solVM.getFeeForMessage()
            }
            
            Divider()
            // FirstAvailableBlockView
            SolInfoView(desc: solVM.firstAvailableBlockModel.infoDesc, content:  solVM.firstAvailableBlockModel.slotStr, eventDesc: solVM.firstAvailableBlockModel.eventDesc) {
                solVM.getFirstAvailableBlock()
            }
            
            Divider()
            // GenesisHashView.
            SolInfoView(desc: solVM.genesisHashModel.infoDesc,
                        content: solVM.genesisHashModel.genesisHash,
                        eventDesc: solVM.genesisHashModel.eventDesc) {
                solVM.getGenesisHash()
            }
            
            Divider()
            // HealthView.
            SolInfoView(desc: solVM.healthModel.infoDesc, content: solVM.healthModel.healthStatus, eventDesc: solVM.healthModel.eventDesc) {
                solVM.getHealth()
            }
            
            Divider()
            // HighestSnapshotSlotView.
            SolInfoView(desc: solVM.highestSlotModel.infoDesc, content: solVM.highestSlotModel.slotInfoStr, eventDesc: solVM.highestSlotModel.eventDesc) {
                solVM.getHighestSnapshotSlot()
            }
            
            Divider()
            // NodeIdentityView
            SolInfoView(desc: solVM.nodeIdModel.infoDesc, content: solVM.nodeIdModel.identity, eventDesc: solVM.nodeIdModel.eventDesc) {
                solVM.getNodeIdentity()
            }
            
            Divider()
            // InflationGovernorView
            SolInfoView(desc: solVM.infGovernorModel.infoDesc, content: solVM.infGovernorModel.governorStr, eventDesc: solVM.infGovernorModel.eventDesc) {
                solVM.getInflationGovernor()
            }
            
            Divider()
            // InflationRateView
            SolInfoView(desc: solVM.infRateModel.infoDesc, content: solVM.infRateModel.rateStr, eventDesc: solVM.infRateModel.eventDesc) {
                solVM.getInflationRate()
            }
            
            Divider()
            // InflationRewardView.
            SolInfoView(desc: solVM.infRewardModel.infoDesc,
                        editableDesc: $solVM.infRewardModel.epochStr,
                        content: solVM.infRewardModel.rewardStr,
                        eventDesc: solVM.infRewardModel.eventDesc) {
                solVM.getInflationReward()
            }
            
            Divider()
            // LargestAccountView.
            SolInfoView(desc: solVM.largAcctsModel.infoDesc,
                        content: solVM.largAcctsModel.acctInfoStr,
                        eventDesc: solVM.largAcctsModel.eventDesc) {
                solVM.getLargestAccounts()
            }
            
            Divider()
            // LatestBlockInfoView.
            SolInfoView(desc: solVM.latestBlkInfoModel.infoDesc,
                        content: solVM.latestBlkInfoModel.blkInfoStr,
                        eventDesc: solVM.latestBlkInfoModel.eventDesc) {
                solVM.getLatestBlockInfo()
            }
            
            Divider()
            // LeaderScheduleView.
            SolInfoView(desc: solVM.leaderScheduleModel.infoDesc,
                        content: solVM.leaderScheduleModel.scheduleStr,
                        eventDesc: solVM.leaderScheduleModel.eventDesc) {
                solVM.getLeaderSchedule()
            }
            
            Divider()
            // MaxRetransmitSlotView
            SolInfoView(desc: solVM.maxRetransmitSlotModel.infoDesc,
                        content: "\(solVM.maxRetransmitSlotModel.slot)",
                        eventDesc: solVM.maxRetransmitSlotModel.eventDesc) {
                solVM.getMaxRetransmitSlot()
            }
            
            Divider()
            // MaxRetransmitSlotView
            SolInfoView(desc: solVM.maxSharedInsertSlotModel.infoDesc,
                        content: "\(solVM.maxSharedInsertSlotModel.slot)",
                        eventDesc: solVM.maxSharedInsertSlotModel.eventDesc) {
                solVM.getMaxShredInsertSlot()
            }
            
            Divider()
            // MinmBalanceForRentExemptionView.
            SolInfoView(desc: solVM.minBalForRentExemptionModel.infoDesc,
                        content: "\(solVM.minBalForRentExemptionModel.balance)",
                        eventDesc: solVM.minBalForRentExemptionModel.eventDesc) {
                solVM.getMinmBalanceForRentExemption()
            }
            
            Divider()
            // MultipleAccountsInfoView.
            SolInfoView(desc: solVM.acctsInfoModel.infoDesc,
                        content: "\(solVM.acctsInfoModel.acctsInfoStr)",
                        eventDesc: solVM.acctsInfoModel.eventDesc) {
                solVM.getMultipleAccountsInfo()
            }
            
            Divider()
            // ProgramAccountsView.
            SolInfoView(desc: solVM.programAccountsModel.infoDesc,
                        content: solVM.programAccountsModel.acctsInfoStr,
                        eventDesc: solVM.programAccountsModel.eventDesc) {
                solVM.getProgramAccounts()
            }
            
            Divider()
            // RecentPerformanceSamplesView.
            SolInfoView(desc: solVM.performanceSamplesModel.infoDesc,
                        editableDesc: $solVM.performanceSamplesModel.sampleNumStr,
                        content: String(describing: solVM.performanceSamplesModel.samples),
                        eventDesc: solVM.performanceSamplesModel.eventDesc) {
                solVM.getRecentPerformanceSamples()
            }
            
            Divider()
            // RecentPrioritizationFeesView.
            SolInfoView(desc: solVM.prioriFeesModel.infoDesc,
                        editableDesc: $solVM.prioriFeesModel.acctAddr,
                        content: String(describing: solVM.prioriFeesModel.feesInfo?.suffix(3)),
                        eventDesc: solVM.prioriFeesModel.eventDesc) {
                solVM.getRecentPrioritizationFees()
            }
            
            Divider()
            // signaturesForAddressView.
            SolInfoView(desc: solVM.signaturesModel.infoDesc,
                        editableDesc: $solVM.signaturesModel.address,
                        content: "\(String(describing: solVM.signaturesModel.signatures))",
                        eventDesc: solVM.signaturesModel.eventDesc) {
                solVM.getSignaturesForAddress()
            }
            
            Divider()
            // SignatureStatusesView.
            SolInfoView(desc: solVM.signatureStatusesModel.infoDesc,
                        editableDesc: $solVM.signatureStatusesModel.signature,
                        content: "\(String(describing: solVM.signatureStatusesModel.statuses))",
                        eventDesc: solVM.signatureStatusesModel.eventDesc) {
                solVM.getSignatureStatuses()
            }
            
            Divider()
            // SlotView.
            SolInfoView(desc: solVM.slotModel.infoDesc,
                        content: "\(solVM.slotModel.slot)",
                        eventDesc: solVM.slotModel.eventDesc) {
                solVM.getSlot()
            }
            
            Divider()
            // SlotLeaderView.
            SolInfoView(desc: solVM.slotLeaderModel.infoDesc,
                        content: solVM.slotLeaderModel.slotleader,
                        eventDesc: solVM.slotLeaderModel.eventDesc) {
                solVM.getSlotLeader()
            }
            
            Divider()
            // SlotLeadersView.
            SolInfoView(desc: solVM.slotLeadersModel.infoDesc,
                        editableDesc: $solVM.slotLeadersModel.startSlotStr,
                        content: "\(solVM.slotLeadersModel.slotleaders)",
                        eventDesc: solVM.slotLeadersModel.eventDesc) {
                solVM.getSlotLeaders()
            }
        
            Divider()
            // StakeMinDelegationView.
            SolInfoView(desc: solVM.stakeMinDelegationModel.infoDesc,
                        content: "\(solVM.stakeMinDelegationModel.minDelegation)",
                        eventDesc: solVM.stakeMinDelegationModel.eventDesc) {
                solVM.getStakeMinimumDelegation()
            }
            
            Divider()
            // SupplyView.
            SolInfoView(desc: solVM.supplyModel.infoDesc,
                        content: String(describing: solVM.supplyModel.supplyInfo),
                        eventDesc: solVM.supplyModel.eventDesc) {
                solVM.getSupply()
            }
            
            Divider()
            // TokenAccountBalanceView.
            SolInfoView(desc: solVM.tokenAcctBalanceModel.infoDesc,
                        editableDesc: $solVM.tokenAcctBalanceModel.tokenAcct,
                        content: String(describing: solVM.tokenAcctBalanceModel.balance),
                        eventDesc: solVM.tokenAcctBalanceModel.eventDesc) {
                solVM.getTokenAccountBalance()
            }
            
            Divider()
            // TokenAccountsByDelegateView.
            SolInfoView(desc: solVM.tokenAcctsByDelegateModel.infoDesc,
                        editableDesc: $solVM.tokenAcctsByDelegateModel.delegate,
                        content: String(describing: solVM.tokenAcctsByDelegateModel.accts?.first),
                        eventDesc: solVM.tokenAcctsByDelegateModel.eventDesc) {
                solVM.getTokenAccountsByDelegate()
            }
            
            Divider()
            // TokenAccountsByOwnerView.
            SolInfoView(desc: solVM.tokenAcctsByOwnerModel.infoDesc,
                        editableDesc: $solVM.tokenAcctsByOwnerModel.owner,
                        content: String(describing: solVM.tokenAcctsByOwnerModel.accts?.first),
                        eventDesc: solVM.tokenAcctsByOwnerModel.eventDesc) {
                solVM.getTokenAccountsByOwner()
            }
            
            Divider()
            // TokenLargestAccountsView.
            SolInfoView(desc: solVM.tokenLargestAccountsModel.infoDesc,
                        editableDesc: $solVM.tokenLargestAccountsModel.tokenAddr,
                        content: String(describing: solVM.tokenLargestAccountsModel.acctsInfo),
                        eventDesc: solVM.tokenLargestAccountsModel.eventDesc) {
                solVM.getTokenLargestAccounts()
            }
            
            Divider()
            // TokenSupplyView.
            SolInfoView(desc: solVM.tokenSupplyModel.infoDesc,
                        editableDesc: $solVM.tokenSupplyModel.tokenAddr,
                        content: String(describing: solVM.tokenSupplyModel.supplyInfo),
                        eventDesc: solVM.tokenSupplyModel.eventDesc) {
                solVM.getTokenSupply()
            }
            
            Divider()
            // TxDetailsView.
            SolInfoView(desc: solVM.txDetailsModel.infoDesc,
                        editableDesc: $solVM.txDetailsModel.txID,
                        content: String(describing: solVM.txDetailsModel.details),
                        eventDesc: solVM.txDetailsModel.eventDesc) {
                solVM.getTransaction()
            }
            
            Divider()
            // TxCountView.
            SolInfoView(desc: solVM.txCountModel.infoDesc,
                        content: "\(solVM.txCountModel.count)",
                        eventDesc: solVM.txCountModel.eventDesc) {
                solVM.getTxCount()
            }
            
            Divider()
            // VersionView.
            SolInfoView(desc: solVM.versionModel.infoDesc,
                        content: String(describing: solVM.versionModel.version),
                        eventDesc: solVM.versionModel.eventDesc) {
                solVM.getVersion()
            }
            
            Divider()
            // VoteAccountsView.
            SolInfoView(desc: solVM.voteAccountsModel.infoDesc,
                        editableDesc: $solVM.voteAccountsModel.votePubkey,
                        content: String(describing: solVM.voteAccountsModel.accts),
                        eventDesc: solVM.voteAccountsModel.eventDesc) {
                solVM.getVoteAccounts()
            }
            
            Divider()
            // BlockhashValidView.
            SolInfoView(desc: solVM.blockhashValidModel.infoDesc,
                        editableDesc: $solVM.blockhashValidModel.blockhash,
                        content: String(describing: solVM.blockhashValidModel.isValid),
                        eventDesc: solVM.blockhashValidModel.eventDesc) {
                solVM.checkIsBlockhashValid()
            }
            
            Divider()
            // BlockhashValidView.
            SolInfoView(desc: solVM.minLedgerSlotModel.infoDesc,
                        content: "\(solVM.minLedgerSlotModel.slot)",
                        eventDesc: solVM.minLedgerSlotModel.eventDesc) {
                solVM.getMinLedgerSlot()
            }
            
            Divider()
            // AirdropInfoView.
            SolInfoView(desc: solVM.airdropRequestModel.infoDesc,
                        editableDesc: $solVM.airdropRequestModel.acctAdress,
                        content: "\(solVM.airdropRequestModel.txHash ?? "No Tx")",
                        eventDesc: solVM.airdropRequestModel.eventDesc) {
                solVM.requestAirdrop()
            }
            
            Divider()
            // SendTxView.
            SolInfoView(desc: solVM.sendTxModel.infoDesc,
                        editableDesc: $solVM.sendTxModel.sentTx,
                        content: "\(solVM.sendTxModel.txSignature)",
                        eventDesc: solVM.sendTxModel.eventDesc) {
                solVM.sendTx()
            }
            
            Divider()
            // TxSimulationView.
            SolInfoView(desc: solVM.txSimulationModel.infoDesc,
                        editableDesc: $solVM.txSimulationModel.txHash,
                        content: String(describing: solVM.txSimulationModel.simulatioInfo),
                        eventDesc: solVM.txSimulationModel.eventDesc) {
                solVM.simulateTx()
            }
        }
    }
}

struct ACTextField: View {
    var titleKey: String
    var text: Binding<String>
    init(_ titleKey: String, text: Binding<String>) {
        self.titleKey = titleKey
        self.text = text
    }
    var body: some View {
        TextField(titleKey, text: text)
            .overlay {
                RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 0.2)
                
            }
    }
}

struct GetterButton: View {
    let title: String
    let action: () -> Void
    var body: some View {
        Button(title) {
            action()
        }
        .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
        .overlay {
            RoundedRectangle(cornerRadius: 5).stroke(.blue, lineWidth: 1)
        }
    }
}

struct BalanceInfoView: View {
    let balanceModel: BlockBalanceModel
    let getBalanceEventHandler: () -> Void
    var body: some View {
        HStack {
            Text("Balance:")
            // Balance
            Text("\(balanceModel.balance)")
                .padding(EdgeInsets(top: 5,
                                    leading: 5,
                                    bottom: 5,
                                    trailing: 5))
                .overlay {
                    RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 0.2)
                }
            GetterButton(title: "Get balance") {
                getBalanceEventHandler()
            }
        }
    }
}

struct AccountInfoView: View {
    let acctInfoModel: AccountInfoModel
    let getAcctInfoEventHandler: () -> Void
    var body: some View {
        HStack {
            Text("Account info:")
            Text("\(acctInfoModel.acctInfoStr)")
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 0.2)
                }
        }.padding()
        GetterButton(title: "Get account info", action: {
            getAcctInfoEventHandler()
        })
    }
}

struct BlockInfoView: View {
    @Bindable var blockInfoModel: BlockInfoModel
    let getBlkInfoEventHandler: () -> Void
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text("Slot Num:")
                ACTextField(blockInfoModel.slotNumStr, text: $blockInfoModel.slotNumStr)
            }
            .padding()
            ScrollView(.vertical) {
                Text(blockInfoModel.blockInfoDesc)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 0.2)
                    }
                    .padding()
            }
            .frame(maxHeight: 200)
            /// GetBlock button
            GetterButton(title: "Get Block Info") {
                getBlkInfoEventHandler()
            }
        }
        .frame(maxHeight: 270)
    }
}

struct BlocksView: View {
    @Bindable var blocksModel: BlocksModel
    let getBlocksEventHandler: () -> Void
    var body: some View {
        HStack {
            Text("Blocks from:")
            ACTextField(blocksModel.startSlotStr, text: $blocksModel.startSlotStr)
            Text("to:")
            ACTextField(blocksModel.endSlotStr, text: $blocksModel.endSlotStr)
        }
       
        Text("\(blocksModel.blocks)")
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 0.2)
            }
        GetterButton(title: "Get Blocks") {
            getBlocksEventHandler()
        }
    }
}

struct LimitedBlocksView: View {
    @Bindable var blocksModel: LimitedBlocksModel
    let getBlocksEventHandler: () -> Void
    var body: some View {
        HStack {
            Text("Limited blocks from:")
                .layoutPriority(1)
            ACTextField("\(blocksModel.startSlotStr)", text: $blocksModel.startSlotStr)
            Text("limit:")
            ACTextField("\(blocksModel.limitStr)", text: $blocksModel.limitStr)
        }
       
        Text("\(blocksModel.blocks)")
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 0.2)
                
            }
        GetterButton(title: "Get Limited Blocks") {
            getBlocksEventHandler()
        }
    }
}

struct BlockTimeView: View {
    @Bindable var blockTimeModel: BlockTimeModel
    let getBlockTimeEventHandler: () -> Void
    var body: some View {
        HStack {
            Text("Block:")
            ACTextField(blockTimeModel.blockHeightStr, text: $blockTimeModel.blockHeightStr)
            Text("'s timestamp:")
            Text("\(blockTimeModel.blockTime)")
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 0.2)
                }
        }
        GetterButton(title: "Get Block Time") {
            getBlockTimeEventHandler()
        }
    }
}

struct FeeForMessageView: View {
    @Bindable var model: FeeForMessageModel
    let eventHandler: () -> Void
    var body: some View {
        HStack {
            Text("Fee for message:")
            ACTextField(model.message, text: $model.message)
        }
        Text("\(model.feeForMessag ?? 0)")
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 0.2)
            }
        GetterButton(title: "Get fee for message") {
            eventHandler()
        }
    }
}

struct SolInfoView: View {
    let desc: String
    var editableDesc: Binding<String>? = nil
    let content: String
    let eventDesc: String
    let eventHandler: () -> Void
    var body: some View {
        HStack {
            Text(desc)
            if let editableDesc = editableDesc {
                ACTextField("\(editableDesc.wrappedValue)", text: editableDesc)
            } else {
                Text(content)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 0.2)
                    }
            }
        }
        if editableDesc != nil {
            Text(content)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 0.2)
                }
        }
        GetterButton(title: eventDesc) {
            eventHandler()
        }
    }
}

#Preview {
    SolanaRPCAPIView()
}
