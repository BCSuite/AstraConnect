//
//  ACSolanaGetHighestSnapshotSlot.swift
//  AstraConnect
//
//  Created by scott on 2025/10/29.
//

import Foundation

/// A namespace represents informations about the Solana  RPC API of getting the highest Snapshot Slot. If solana-core is v1.9 or newer, using the 'getHighestSnapshotSlot'
/// method, otherwise using the 'getSnapshotSlot' method.
/// The official doc is https://solana.com/docs/rpc/http/gethighestsnapshotslot.
public enum ACSolanaGetHighestSnapshotSlot {
    
    /// Name of the getHighestSnapshotSlot RPC method when the Solana-core version is not less than v1.9.
    public static let methodName = "getHighestSnapshotSlot"
    
    /// Name of the getSnapshotSlot RPC method when the Solana-core version is  less than v1.9.
    public static let lowCoreVersionMethodName = "getSnapshotSlot"
}

extension ACSolanaInteractor {
    
    /// Getting the highest full snapshot slot, and the highest incremental snapshot slot based on the full snapshot slot, if there is one.
    /// - Parameters:
    ///  - solCoreVersion: The Solana-core version, if it's v1.9 or newer, using the 'getHighestSnapshotSlot' method, otherwise using the
    /// 'getSnapshotSlot' method.
    ///  - rpcAddress: Detailed RPC service address to be interacted. If set non empty value then using it, otherwise using interactor's 'rpcAddress'.
    ///  - dataStreamParams: Data stream related params including RPC data type, request generators, etc. Default value is ACSolanaReqDataStreamParams.
    /// - Returns: A ACSolanaSnapshotSlotInfo which represents the slot informations that the node has snapshots for.
    public func getHighestSnapshotSlot(solCoreVersion: SolanaCoreVersionKind = .notLessThanV1Dot9,
                                       rpcAddress: String? = nil,
                                       dataStreamParams: any ACReqDSA = ACSolReqDSP())
    async throws -> ACSolanaSnapshotSlotInfo {
        var methodName = ACSolanaGetHighestSnapshotSlot.methodName
        if solCoreVersion == .lessThanV1Dot9 {
            methodName = ACSolanaGetHighestSnapshotSlot.lowCoreVersionMethodName
        }
        return try await callRPCMethod(methodName,
                                       rpcAddress: rpcAddress,
                                       dataStreamParams: dataStreamParams)
    }
}
