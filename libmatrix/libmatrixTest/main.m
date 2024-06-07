//
//  main.m
//  libmatrixTest
//
//  Created by Shengkang Duan on 10/4/2024.
//

#import <Foundation/Foundation.h>
#import "libmatrix.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int data1[] = {1,2,3,4,5,6,7,8,9};
        IntMatrix *matrix1 = [[IntMatrix alloc] initWithRows:3 Columns:3 Numbers:data1];
        int data2[] = {4,5,3,6,8,9,7,5,2};
        IntMatrix *matrix2 = [[IntMatrix alloc] initWithRows:3 Columns:3 Numbers:data2];
        IntMatrix *matrix3 = [matrix1 add:matrix2];
    }
    return 0;
}
