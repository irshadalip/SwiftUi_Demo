/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a list of landmarks.
*/

import SwiftUI

struct LandmarkList: View {
    
    //@State var showFavoritesOnly = true
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        NavigationView {
            List{
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Show Favorites List")
                }
                ForEach(userData.landmarks){ landmark in
                    if !self.userData.showFavoritesOnly == true || (self.userData.showFavoritesOnly == true && landmark.isFavorite){
                        NavigationLink(destination: LandmarkDetail(landmark: landmark).environmentObject(self.userData)
                        ) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }.navigationBarTitle(Text("Landmarks"))
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList().environmentObject(UserData())
        }
    }
}
