/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a landmark.
*/

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    @EnvironmentObject var userData : UserData
    
    var LandmarkIndex : Int{
        userData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }

    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)

            CircleImage(image: landmark.image)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack{
                    Text(landmark.name).font(.title)
                    Button(action: {
                        //Update Favoirt Data.
                        self.userData.landmarks[self.LandmarkIndex].isFavorite.toggle()
                    }) {
                        if userData.landmarks[self.LandmarkIndex].isFavorite{
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                        }
                        else{
                            Image(systemName: "star").foregroundColor(.gray)
                        }
                    }
                }
                HStack(alignment: .top) {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
            .padding()

            Spacer()
        }
        .navigationBarTitle(Text(verbatim: landmark.name), displayMode: .inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0]).environmentObject(UserData())
    }
}
