From: Dan Golick <dgolick-/r/FFsq0CnC7zZZRDBGcUA@public.gmane.org>
Subject: Re: Free Fermi cards to interested developers and
	researchers
Date: Fri, 30 Apr 2010 07:43:16 -0400
Message-ID: <h2h45fd21a21004300443jb6b0d2b9n174e29b91a36af12@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2028029054=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============2028029054==
Content-Type: multipart/alternative; boundary=0016e65b61d0c84470048572bf40

--0016e65b61d0c84470048572bf40
Content-Type: text/plain; charset=ISO-8859-1

Hi Christopher,

I'm a software developer working on mass spectrometer analysis software and
proteomics research software.

Currently I'm implementing 3 dimensional peak detection software using CUDA.
 The data is 300,000, by a 2000 by 200 and I'm implementing a highly
optimized 3d convolution. The filters are unique for each point in the
matrix.
The data set is time by mass by mobility.

Processing of this data on the CPU takes in excess of 5 hours.  At these
rates this commercialization of this kind of processing is not feasible.  I
estimate it will process in about 30 minutes on the GPU.

The trouble with CUDA is that in order to get good optimization I have to
take into account all the details of the hardware and hand optimize each
part.  I have to partition the problem into carefully sized blocks and then
measure different ways of partitioning the problem.  It turns a relatively
simple problem into a huge bookkeeping project tracking each little block of
data.

I would be very interested in helping with any project that would improve
the compiler/language support for processing on the gpu.  A language that is
more declarative (describing what we want to do rather than how) with a
gpu-aware optimizing compiler and a processing engine to drive the
processing would be great.

My next GPU project is large scale searching of ion datasets against huge
protein databases.  I want to implement as much of the searching on the gpu
as possible to speed this up.  I'm looking at thrust now but I probably want
more of the implementation in the kernel so that I can load databases of
masses (on the order of billions) and do several 100,000 searches against
it.


A fermi card would be of great use to me in this processing and I would be
happy to contribute to your project by writing drivers or libraries for you.

My background:  I've been a software consultant for 16 years and was an
individual contributer for 10 years before that.  I have a lot of experience
in embedded systems, algorithm design as well as application development.

You can see more about me at my linked in profile:
http://www.linkedin.com/in/dangolick

Regards,
    Dan

--0016e65b61d0c84470048572bf40
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Christopher,<div><br></div><div>I&#39;m a software developer working on =
mass spectrometer analysis software and proteomics research software.</div>=
<div><br></div><div>Currently I&#39;m implementing 3 dimensional peak detec=
tion software using CUDA. =A0The data is 300,000, by a 2000 by 200 and I&#3=
9;m implementing a highly optimized 3d convolution. The filters are unique =
for each point in the matrix.=A0</div>
<div>The data set is time by mass by mobility.</div><div><br></div><div>Pro=
cessing of this data on the CPU takes in excess of 5 hours. =A0At these rat=
es this commercialization of this kind of processing is not feasible. =A0I =
estimate it will process in about 30 minutes on the GPU.</div>
<div><br></div><div>The trouble with CUDA is that in order to get good opti=
mization I have to take into account all the details of the hardware and ha=
nd optimize each part. =A0I have to partition the problem into carefully si=
zed blocks and then measure different ways of partitioning the problem. =A0=
It turns a relatively simple problem into a huge bookkeeping project tracki=
ng each little block of data.</div>
<div><br></div><div>I would be very interested in helping with any project =
that would improve the compiler/language support for processing on the gpu.=
 =A0A language that is more=A0declarative=A0(describing what we want to do =
rather than how) with a gpu-aware optimizing compiler and a processing engi=
ne to drive the processing would be great.</div>
<div><br></div><div>My next GPU project is large scale searching of ion dat=
asets against huge protein databases. =A0I want to implement as much of the=
 searching on the gpu as possible to speed this up. =A0I&#39;m looking at t=
hrust now but I probably want more of the implementation in the kernel so t=
hat I can load databases of masses (on the order of billions) and do severa=
l 100,000 searches against it.</div>
<div><br></div><div><br></div><div>A fermi card would be of great use to me=
 in this processing and I would be happy to=A0contribute=A0to your project =
by writing drivers or libraries for you.</div><div><br></div><div>My backgr=
ound: =A0I&#39;ve been a software consultant for 16 years and was an indivi=
dual contributer for 10 years before that. =A0I have a lot of experience in=
 embedded systems, algorithm design as well as application development.</di=
v>
<div><br></div><div>You can see more about me at my linked in profile:</div=
><div><a href=3D"http://www.linkedin.com/in/dangolick">http://www.linkedin.=
com/in/dangolick</a></div><div><br></div><div>Regards,</div><div>=A0=A0 =A0=
Dan</div>

--0016e65b61d0c84470048572bf40--

--===============2028029054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2028029054==--
