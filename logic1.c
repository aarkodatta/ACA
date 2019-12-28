#include<stdio.h>
int main()
{
   int i,n,a[50],b[50],m[50],p[50],q[i];
   printf("AND using NOR");
   printf("\nEnter N value:");
   scanf("%d",&n);
   printf("\n value of n=%d",n);
   for(i=1;i<=n;i++)
   {
   	printf("\nENTER VALUE OF A[%d]=",i);
   	scanf("%d",&a[i]);
   }
   for(i=1;i<=n;i++)
   {
   		printf("\nENTER VALUE OF B[%d]=",i);
   	    scanf("%d",&b[i]);
   }
   for(i=1;i<=n;i++)
   {
   	if(a[i]==0 && a[i]==0)
   	 m[i]=1;
   	else
   	 m[i]=0;   	
   }
    for(i=1;i<=n;i++)
   {
   	if(b[i]==0 && b[i]==0)
   	 p[i]=1;
   	else
   	 p[i]=0;   	
   }
   for(i=1;i<=n;i++)
   {
   	if(m[i]==0 && p[i]==0)
   	 q[i]=1;
   	else
   	 q[i]=0;
   }
   printf("\n\tA\tB\tAND\n");
   printf("\n -------------------------------------");
   for(i=1;i<=n;i++)
   printf("\n\t%d\t%d\t%d\n",a[i],b[i],q[i]);
   
}
