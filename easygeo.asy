import geometry;

// 默认的垂直符号太大了,减小一点
markangleradiusfactor /= 3;


// 平面几何作图需要对大量的点添加标签,做这个初始化表是为了解决这个问题,虽然有点丑,但可以实现.我实在不知道此语言有什么办法能返回变量名字
// 原理是给全部26个字母初始化为一个很远的点,在最后把需要标签的点集和全部点集作比较
// 将二者的公共点用strlist的对应字符串进行标签,比如下例,在完成所有需要的点的定义之后执行即可标记所有需要的点,可以简化很多标签的工作
// point[] p={A,B,C,D,E,F,X,Y,Z,M,N};
// point[] plist={A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z};
// for(int i=0;i<p.length;++i){
// 	for(int j=0;j<26;++j){
// 	if(p[i]==plist[j])
// 	dot(strlist[j],p[i]);
// }
// }
string[] strlist={"$A$","$B$","$C$","$D$","$E$","$F$","$G$","$H$","$I$","$J$","$K$","$L$","$M$","$N$","$O$","$P$","$Q$","$R$","$S$","$T$","$U$","$V$","$W$","$X$","$Y$","$Z$"};
point A=(1000,1000),B=(1000,1000),C=(1000,1000),D=(1000,1000),E=(1000,1000),F=(1000,1000),G=(1000,1000),H=(1000,1000),I=(1000,1000),J=(1000,1000),K=(1000,1000),L=(1000,1000),M=(1000,1000),N=(1000,1000),O=(1000,1000),P=(1000,1000),Q=(1000,1000),R=(1000,1000),S=(1000,1000),T=(1000,1000),U=(1000,1000),V=(1000,1000),W=(1000,1000),X=(1000,1000),Y=(1000,1000),Z=(1000,1000);

// 返回与直线AB切于A且过C的圆
circle tangentABC(point A,point B,point C) 
{
	point B2=scale(length(B-A)^2/length(B-C)^2,B)*C;
	return circle(B2,A,C);
}

// A在BC上的投影
point foot(point A,point B,point C)
{
	return projection(line(B,C))*A;
}

// A在圆c上,求直线AB与圆c的另外一个交点
point intersectionpoint(circle c,point A,point B)
{
	point[] p=intersectionpoints(line(A,B),c);
	if(p[0]==A)
		return p[1];
	else
		return p[0];
}

// A在c上,求直线AB与c的另外一个交点
point intersectionpoint(path c,point A,point B)
{
	point[] p=intersectionpoints(line(A,B),c);
	if(p[0]==A)
		return p[1];
	else
		return p[0];
}
// 返回三角形ABC的垂心
point chuixin(point A,point B,point C)
{
	return orthocentercenter(triangle(A,B,C));
}

// 默认返回 \angle BAC 的内角平分线,如果 sharp=false,返回外角平分线
line bisector(point A,point B,point C,bool sharp=true)
{
	if(sharp)
		return bisector(line(A,false,B),line(A,false,C));
	else
		return perpendicular(A,bisector(line(A,false,B),line(A,false,C)));
}

// 返回分割满足 AP=t PB 的点P,向量意义下,也就是高中教材里的定比分点
point fendian(point A,point B,real t)
{
	point C=(A+t*B)/(1+t);
	return C;
}

// 返回到A,B距离之比为t的阿氏圆
circle acircle(point A,point B,real t)
{
	return circle(fendian(A,B,t),fendian(A,B,-t));
}
