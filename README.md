<BODY>

<DIV id="id_1">
<H1> Broader Frame Work for Lensometry</H1>
</DIV>
<DIV id="id_2_1">
<P class="p9 ft6"><H2> Introduction </H2></P>
<P class="p10 ft6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Today’s lensometer doesn’t consider peripheral rays because it is 
designed to test uniform lens-using only paraxial rays near the lens center. For multi-focal lenses it is used at the center of each zone separately,
revealing nothing about the ‘progressive’ transition between zones without sharp boundaries. We try to measure a progressive lens by considering
peripheral and paraxial rays, over the complete surface area of eye glasses. The paraxial approximation assumes that a lens has a ‘focal plane’ for
particular rays, but even its existence is an approximation, let alone its planarity. In power calculations, failures of approximation are not taken into
account. The importance of considering them is illustrated. We use Xelset image segmentation, Matlab, C++, HTML 5, and Java 2D graphics to test
our broader concepts.
</P>
<P class="p10 ft6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In order to analyze a lens seen through a camera, we create an
image. In order to calculate the properties of the lens, we should know complete characteristics of the deflection. A colored image is created using
spatial weights on colors, photographed, and the result analyzed for its match to theory. Analysis of this image is carried out. Next set of analysis is carried out for the image seen via lens. From these analyses, we expect our procedural experiment to find power of the lens to produce different set of
power values for our eye glasses. These numbers are expected to provide exact power of lens at each and every point of eye glasses. Hence these
numbers (power values) could replace the old inaccurate methods of qualifying the power of the lens
</P>
</DIV>
<DIV id="id_2_2">
<P class="p9 ft6"><H2> Methodology </H2></P>
</DIV>
<DIV id="id_2_2">
<P class="p9 ft6"><H3> Construction of Image and fake data </H3></P>
<P class="p12 ft6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To find the power of the lens, we need to have an image wherein we know
all the properties of that image, and this image is called the “mire image”. It is from the concept where pixels used to be represented as triangles not square or rectangles. The colors at each point were given weights around the corner. Now for our image we give weights as 1 on the corner for rgb image. We consider a regular triangle. By cutting the triangle at 0.666 of pixel value on all the three corners we get hexagon. Knowing the co-ordinates and pixel value at each point we proceed to other equations which give us power of the lens. The power of the lens is implemented using matlab, as matlab was invented to solve huge matrix equations. This best suits for this application.
</P>
</DIV>
![image](https://cloud.githubusercontent.com/assets/11435669/21469149/711a5698-ca0a-11e6-8192-8c2f1c8a3aed.png)
<DIV id="id_2_3">
<P class="p9 ft6"><H3> Procedure to find the power of the lens </H3></P>
<P class="p15 ft6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;We find power of the lens using transformation matrices and polynomials.
We get these transformation matrices and polynomials as follow:
<br />
i. We created the mire image in pervious section.We view mire through a non-powered lens (assume) .The viewed image will go through various steps of printing and being viewed via camera. In all these the co-ordinates of origin could be changed for which we get the transformation matrix, as follows:
</P>
</DIV>
![image](https://cloud.githubusercontent.com/assets/11435669/21469169/e192d850-ca0a-11e6-9cbd-e4aac6fb2ecb.png)
<DIV id="id_2_3">
<P class="p15 ft6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Procedure to get this matrix is first get the corners of the mire using Hough transformation. This gives you i,j. We know u,v from corner co-ordinates of mire. We substitute these in above matrix and apply least square to get values of a, b, c,
d, u0 and v0 constants
</DIV>

<DIV id="id_2_3">
<P class="p15 ft6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ii. We get of transformation polynomials (sfr, sfg, sfu, sfv) are as shown in the figure below:
</DIV>
![image](https://cloud.githubusercontent.com/assets/11435669/21469190/b1ecb14c-ca0b-11e6-9007-4411b2e6f0ad.png)
<DIV id="id_2_3">
<P class="p15 ft6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Explanation for sfr and sfg polynomial: we take i,j of image and find u,v
(mire co-ordinates) and knowing mire characteristic matrix we find RG which should be
seen . Hence sfr and sfg are polynomial with (RG) should_be_Seen dependent and (RG)
seen of image as independent matrix.
<br />
Explanation for sfu and sfv polynomial: the transformation matrices are
applied in the direction shown in image above. And sfu is polynomial for (uv) lens as
dependent and (uv) nolens as independent matrix.
<br />
There are many ways to find power of lens (refer web) for our application
 we have used transformation matrices. We use the simple first degree sfu and sfv polynomial and ignore higher degree polynomials. Cause, as we go to higher degree polynomial affine transformation leads to larger value of lower degree term in polynomial than expected. For power calculations, we have viewed the mire image using various lens. Powers rang from -0.5 to -12 for concave and 0.5 to 12 for convex. We have adjusted
our mire to lens distance such that the image formed when viewed from camera doesn’t flip 
</DIV>

<DIV id="id_1_2">
<P class="p22 ft10"><SPAN class="ft10"><H2> Results and Discussions </H2></P>
</DIV>
<DIV id="id_1_2">
<P class="p22 ft10"><SPAN class="ft10"><H3> Unavoidable Errors </H3></P>
<P class="p23 ft9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Humans (Homo sapiens) are sensitive to three different colors. The receptors
in our eyes are red, blue and green. If we were to view an object, the receptors in our eye would get stimulated at different places, depending on the objects color. If the object were to be blue our blue receptors would be stimulated. The receptors in human eye have different arrangement of spectrum for these red, blue and green colors as shown in figure.The spectrum of light (continuous range of colors) is uniform along the bandwidth of frequencies. The spectrum of curve for red, blue and green is similar at different frequency. But practically, camera intercept variedly than eye. The RGB color reported by the camera is not the correct RGB color that the printer was told to print. The variation in camera results in unavoidable errors. 
</P>
</DIV>
![image](https://cloud.githubusercontent.com/assets/11435669/21469250/435200fe-ca0e-11e6-907a-09aeb205ed32.png)

<DIV id="id_1_2">
<P class="p22 ft10"><SPAN class="ft10"><H3>  Error Handling and Recovery </H3></P>
<P class="p23 ft9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;From previous section, we saw how the printing errors are unavoidable.
Thereby the mire image which is photographed (with or without lens) has to be analyzed for minimality of these errors. We also saw how to find sfr and sfg polynomials. These are the polynomials depicting the value of color seen and color that has to be seen. It uses ideal mire created for this mapping.
In first we see sfr and sfg plots for ideal mire. In second color we see sfr and sfg plots for camera images (mire). 
</P>
<P class="p23 ft9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The above variation in sfr and sfg, doesn’t affect our analysis. As the solution lies in the concept itself. Our polynomials sfr and sfg gives one to one mapping of colors. Hence no matter where the pixel of color is, it is mapped exactly to where it has to be. Next we will consider mean square errors (RGdiff). 
</P>
</DIV>
| type | Ideal | Actual |
| ------------- | ------------- | ------------- |
| sfr  | ![image](https://cloud.githubusercontent.com/assets/11435669/21469262/2a512f34-ca0f-11e6-8aaf-0567bea47ada.png)  | ![image](https://cloud.githubusercontent.com/assets/11435669/21469268/706714ca-ca0f-11e6-98ac-ffdfc8da5ccd.png) |
| sfg  | ![image](https://cloud.githubusercontent.com/assets/11435669/21469265/617dd50c-ca0f-11e6-9d6d-fa62cfe6c592.png) | ![image](https://cloud.githubusercontent.com/assets/11435669/21469271/7d83cafe-ca0f-11e6-8e93-5344b5a93717.png) |
| RGdiff  | ![image](https://cloud.githubusercontent.com/assets/11435669/21469279/1d330ace-ca10-11e6-8e0a-73795ae23bc6.png) | ![image](https://cloud.githubusercontent.com/assets/11435669/21469280/2c8b9d92-ca10-11e6-8e8d-d5fd1124c986.png) |
<DIV id="id_1_2">
<P class="p23 ft9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Comparing RGdiff we find that in second case the mean square error is 7% more than first case. But eye-opener is the fact that mean square error is considerably minimum, at the center, in Figure below. This show the unavoidable errors of pervious section can be compensated by considering center region of mire for our analysis
</P>
</DIV>
![image](https://cloud.githubusercontent.com/assets/11435669/21469282/7b4562d8-ca10-11e6-87ef-a68f1106f5f4.png)

<DIV id="id_1_2">
<P class="p22 ft10"><SPAN class="ft10"><H2> Results </H2></P>
<P class="p23 ft9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Using Power Code described we get power values for a particular lens. We experimented using various convex and concave lenses. We also experimented with different gap distance. Here gap is the distance between mire image and the lens stand.  Our computed power values are as shown below.
</P>
</DIV>
![image](https://cloud.githubusercontent.com/assets/11435669/21469667/29312d6a-ca2e-11e6-8f5b-d3a911d12d2a.png)

<DIV id="id_1_2">
<P class="p22 ft10"><SPAN class="ft10"><H5> Why are lower computed power values varying from actual power values? </H5></P>
<P class="p23 ft9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To explain the above question, we consider the deflection of rays (see Figure below) considering no lens mire image. In this deflection image we can see initial deflections. These initial deflections are supposed to be zero. As they are not zero they influence lower power values.
</P>
</DIV>
![image](https://cloud.githubusercontent.com/assets/11435669/21469293/8d4d163c-ca11-11e6-8bdd-edcae06e30dd.png)

<DIV id="id_1_2">
<P class="p22 ft10"><SPAN class="ft10"><H3> Deflection of Rays </H3></P>
<P class="p23 ft9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; We came to realization that initial deflections were the
cause for: computed power values not to match actual power values. Soon after that we
extracted deflection images for various portion of, mire seen through lens. As a result,
these are the following images (figure 4.6).
</P>
</DIV>
![image](https://cloud.githubusercontent.com/assets/11435669/21469307/1ce47182-ca12-11e6-87b8-e0bfb4a49e2b.png)
<DIV id="id_1_2">
<P class="p23 ft9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  In this figure you see the initial deflection of mire without camera. This is considered as the ideal deflection case. 
</P>
</DIV>
![image](https://cloud.githubusercontent.com/assets/11435669/21469314/79dab450-ca12-11e6-9a96-97133eff772d.png)
<DIV id="id_1_2">
<P class="p23 ft9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Now let us see the deflection images for concave lens and convex lens.
</P>
</DIV>
![image](https://cloud.githubusercontent.com/assets/11435669/21469321/bc1bc6b0-ca12-11e6-855a-eedb4608b610.png)
![image](https://cloud.githubusercontent.com/assets/11435669/21469330/e53d075c-ca12-11e6-95b2-51e0ff4d3f33.png)
![image](https://cloud.githubusercontent.com/assets/11435669/21469332/fd4b0600-ca12-11e6-80e4-cafda4cdf61e.png)
![image](https://cloud.githubusercontent.com/assets/11435669/21469336/312a3e78-ca13-11e6-8e20-e00d05e81e42.png)

<DIV id="id_1_2">
<P class="p22 ft10"><SPAN class="ft10"><H2> Conclusion </H2></P>
<P class="p23 ft9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; First let us in short make note of things we have achieved. In this project we scrutinized concepts of our project. Also we executed our power code, which resulted in deflection images and power values. Now let us bind all these concepts together. Our problem statement suggested that we consider peripheral rays, to produce power values. Hence we built a system to measure the deflection images and power values. Power of the lens was calculated from a image called ‘mire’. In order to calculate power of lens, we had to retrieve several transformation matrices and polynomials. Finally power of each convex and concave lens was established. Finally after we scrutinized the errors on power values, we realised that: printing errors will be least at the center of the mire. Thereby we conclude our project with power plots proving our conceptual idea to find power of the lens. 
</P>
</DIV>


<DIV id="id_1_2">
<P class="p80 ft10"><SPAN class="ft10"><H2> References </H2></P>
<P class="p136 ft59"><SPAN class="ft29">[1]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN>“A broader framework for lensometry”, Dr.Tim Poston </P>
</DIV>
</BODY>
</HTML>
