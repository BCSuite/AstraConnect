//
//  ChainListView.swift
//  AstractConnectExample
//
//  Created by scott on 2025/11/2.
//

import SwiftUI

struct ChainInfo {
    var name: String
}

struct ChainListRow: View {
    let info: ChainInfo
    var body: some View {
        Text(info.name)
            .font(.system(size: 25))
            .foregroundStyle(.blue)
        Spacer()
    }
}

struct ChainListView: View {
    @State var chainInfos = [ChainInfo(name: "Solana")]
    var chainViewMap: [String: any View] = ["Solana": SolanaRPCAPIView()]
    let handler = {}
    var body: some View {
        NavigationSplitView {
            List(chainInfos, id: \.name) { info in
                NavigationLink {
                    chooseDestinationView(by: info)
                } label: {
                    ChainListRow(info: info)
                }
            }
            .navigationTitle("Chains")
        } detail: {
            Text("Select a chain")
        }
    }
    
    func chooseDestinationView(by chainInfo: ChainInfo) -> AnyView {
        if let view = chainViewMap[chainInfo.name] {
            return AnyView(view)
        }
        return AnyView(EmptyView())
    }
}

#Preview {
    ChainListView()
}
