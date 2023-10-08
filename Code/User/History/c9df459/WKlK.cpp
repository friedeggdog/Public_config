#include<bits/stdc++.h>
using namespace std;

vector<int> prevsmol(vector<int> arr){
        stack<int> s;
        vector<int> ans;
        for(int i=0;i<arr.size();i++){
            while(!s.empty()&&arr[s.top()]>=arr[i]){
                s.pop();
            }
            if(s.empty()) ans.push_back(-1);
            else ans.push_back(s.top());
            s.push(i);
        }
        return ans;
    }
    
    vector<int> nextsmol(vector<int> arr){
        stack<int> s;
        int size=arr.size();
        vector<int> ans(size);
        for(int i=arr.size()-1;i>=0;i--){
            while(!s.empty()&&arr[s.top()]>=arr[i]){
                s.pop();
            }
            if(s.empty()) ans[i]=size;
            else ans[i]=s.top();
            s.push(i);
        }
        return ans;
    }
    
    int largestRectangleArea(vector<int> heights) {
        vector<int> next=nextsmol(heights);
        vector<int> prev=prevsmol(heights);
        int maxx=0;
        for(int i=0;i<heights.size();i++){
            maxx=max(maxx,(next[i]-prev[i]-1)*heights[i]);
        }
        return maxx;
    }
    int maximalRectangle(vector<vector<int>> mat) {

        int out=largestRectangleArea(mat[0]);

        for(int i=1;i<mat.size();i++){
            for(int j=0;j<mat[0].size();j++){
                if(mat[i][j]){
                    mat[i][j]+=mat[i-1][j];
                }
            }
            out=max(out,largestRectangleArea(mat[i]));
        }

        return out;
    }

int main(){
    int rows,cols;
    cin>>rows>>cols;
    vector<vector<int>> matrix;
    for(int i=0;i<rows;i++){
        vector<int> row;
        for(int j=0;j<cols;j++){
            int ele; cin>>ele;
            row.push_back(ele);
        }
        matrix.push_back(row);
    }
    cout<<maximalRectangle(matrix);
    return 0;
}