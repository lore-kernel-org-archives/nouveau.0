From: aik <aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: running x.org on powerpc64 with nvidia6200
Date: Fri, 13 Feb 2009 22:49:59 +0300
Message-ID: <4995CEE7.2040805@gmail.com>
References: <49959366.2000805@gmail.com>
	<20090213211243.60d6955a@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0017192974=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090213211243.60d6955a-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--===============0017192974==
Content-Type: multipart/alternative;
 boundary="------------010008090800010904060201"

This is a multi-part message in MIME format.
--------------010008090800010904060201
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for the prompt reply. My comments are below.


Pekka Paalanen wrote:
>> 0005:01:00.0 VGA compatible controller: nVidia Corporation NV44 [GeForce 
>> 6200 LE] (rev a1) (prog-if 00 [VGA controller])
>>     
>
> Hmm, note the bus id.
>   

I actually did, but I have no idea how to interpret this. x86 linux show 
only 3 numbers for every device, but this server has 6 PCI roots with 
separate bus numbering so if we want to use 3 numbers system, the bus-id 
needs to be fixed somehow...

>> [root@localhost ~]# ls -la /dev/fb*
>> crw------- 1 root root 29, 0 2009-02-13 10:19 /dev/fb
>>     
>
> This is offb, right? If it is nvidiafb, you need to use... can't recall,
> see here: http://nouveau.freedesktop.org/wiki/Kernel_Framebuffer_Driver
>
> The device you should get from nouveau DRM is /dev/dri/card0.
Note this place. I'll ask later :)
>
>> (II) Primary Device is: PCI 01@05:00:0
>>     
>
> Above it says bus id (5@1:0:0) and here 01@05:00:0...
> could that be the problem?
>
>   
I'd like anybody to tell what do they write (or see after auto-config) 
as PCI-id for their videos on ppc. I think that it might be a problem.

>> Section "Device"
>>         Driver      "nouveau"
>>         VendorName  "nVidia Corporation"
>>         BoardName   "NV44 [GeForce 6200 LE]"
>>         BusID       "PCI:1:0:0"
>>     
>
> And this is a third bus id, different from the two above?
> It's confusing at least. Try without any BusID in config?
>   

For example? What string would at least look correct? I did try a lot of 
them but to no avail.
>> 3. what am I doing wrong in my expirements? I can see 4 types of drivers:
>> - original drivers coming with the fedora10 kernel (I got rid of them 
>> before started playing with nouveau because they did not create even 
>> /dev/fb*);
>>     
>
> That's the kernel framebuffer driver device, which is usually harmful
> to accelerated X.org drivers, but since you have ppc, you probably
> need something. The offb driver in kernel should work.
>   


Is /dev/dri/card0 the only device node needed for X? Do not we need /dev/fb(0) as well? Or we need both, do we?


>> - drm drivers (which are replacement for the original onesm right?)
>>     
> Original what?
>   
Original I meant is the .ko which appears after compiling the Linux 
kernel with the nVidia driver enabled as a module.
My point was that there can be only it OR drm driver loaded. At least, 
the original drriver does not start (and does not create /dev/fb - I am 
not sure tha it has to, but anyway) because it fails on reading the 
nVidia registers in the very beginning (while executing its _probe) - 
all the memory space mapped via PCI BAR0 is empty.

> DRM modules are the kernel part of the Nouveau driver. Without them you
> don't get any acceleration. These are not kernel framebuffer drivers (yet,
> at least).
>   

But is the original (from the linux kernel tree) driver required to make 
things working at all?

>> - x.org drivers (which I've not changed/replaced)
>>     
>
> nouveau_drv.so, required, from git.
>   

It is accessed via /dev/dri/card0, right?

>> - mesa drivers - what is their role - I still do not understand.
>>     
>
> 3D acceleration. Not in any usable state at this time, and not
> included in any Mesa release yet. You can just forget it and enjoy
> software OpenGL rendering.
>   

Cool! There are already too many things so excluding any of them is 
helpful :-)

Actually I start thinking that I need to look for the linux capable to 
start with X on PlayStation3. It can have clues...

--------------010008090800010904060201
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
</head>
<body bgcolor="#ffffff" text="#000000">
Thanks for the prompt reply. My comments are below.<br>
<br>
<br>
Pekka Paalanen wrote:
<blockquote cite="mid:20090213211243.60d6955a-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org"
 type="cite">
  <blockquote type="cite">
    <pre wrap="">0005:01:00.0 VGA compatible controller: nVidia Corporation NV44 [GeForce 
6200 LE] (rev a1) (prog-if 00 [VGA controller])
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Hmm, note the bus id.
  </pre>
</blockquote>
<br>
I actually did, but I have no idea how to interpret this. x86 linux
show only 3 numbers for every device, but this server has 6 PCI roots
with separate bus numbering so if we want to use 3 numbers system, the
bus-id needs to be fixed somehow...<br>
<br>
<blockquote cite="mid:20090213211243.60d6955a-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org"
 type="cite">
  <blockquote type="cite">
    <pre wrap="">[root@localhost ~]# ls -la /dev/fb*
crw------- 1 root root 29, 0 2009-02-13 10:19 /dev/fb
    </pre>
  </blockquote>
  <pre wrap=""><!---->
This is offb, right? If it is nvidiafb, you need to use... can't recall,
see here: <a class="moz-txt-link-freetext" href="http://nouveau.freedesktop.org/wiki/Kernel_Framebuffer_Driver">http://nouveau.freedesktop.org/wiki/Kernel_Framebuffer_Driver</a>

The device you should get from nouveau DRM is /dev/dri/card0.</pre>
</blockquote>
Note this place. I'll ask later :)<br>
<blockquote cite="mid:20090213211243.60d6955a-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org"
 type="cite"><br>
  <blockquote type="cite">
    <pre wrap="">(II) Primary Device is: PCI 01@05:00:0
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Above it says bus id (5@1:0:0) and here 01@05:00:0...
could that be the problem?

  </pre>
</blockquote>
I'd like anybody to tell what do they write (or see after auto-config)
as PCI-id for their videos on ppc. I think that it might be a problem.<br>
<br>
<blockquote cite="mid:20090213211243.60d6955a-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org"
 type="cite">
  <blockquote type="cite">
    <pre wrap="">Section "Device"
        Driver      "nouveau"
        VendorName  "nVidia Corporation"
        BoardName   "NV44 [GeForce 6200 LE]"
        BusID       "PCI:1:0:0"
    </pre>
  </blockquote>
  <pre wrap=""><!---->
And this is a third bus id, different from the two above?
It's confusing at least. Try without any BusID in config?
  </pre>
</blockquote>
<br>
For example? What string would at least look correct? I did try a lot
of them but to no avail.<br>
<blockquote cite="mid:20090213211243.60d6955a-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org"
 type="cite">
  <blockquote type="cite">
    <pre wrap="">3. what am I doing wrong in my expirements? I can see 4 types of drivers:
- original drivers coming with the fedora10 kernel (I got rid of them 
before started playing with nouveau because they did not create even 
/dev/fb*);
    </pre>
  </blockquote>
  <pre wrap=""><!---->
That's the kernel framebuffer driver device, which is usually harmful
to accelerated X.org drivers, but since you have ppc, you probably
need something. The offb driver in kernel should work.
  </pre>
</blockquote>
<br>
<br>
<pre wrap="">Is /dev/dri/card0 the only device node needed for X? Do not we need /dev/fb(0) as well? Or we need both, do we?
</pre>
<br>
<blockquote cite="mid:20090213211243.60d6955a-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org"
 type="cite">
  <blockquote type="cite">
    <pre wrap="">- drm drivers (which are replacement for the original onesm right?)
    </pre>
  </blockquote>
  <pre wrap=""><!---->Original what?
  </pre>
</blockquote>
Original I meant is the .ko which appears after compiling the Linux
kernel with the nVidia driver enabled as a module.<br>
My point was that there can be only it OR drm driver loaded. At least,
the original drriver does not start (and does not create /dev/fb - I am
not sure tha it has to, but anyway) because it fails on reading the
nVidia registers in the very beginning (while executing its _probe) -
all the memory space mapped via PCI BAR0 is empty.<br>
<br>
<blockquote cite="mid:20090213211243.60d6955a-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org"
 type="cite">
  <pre wrap="">DRM modules are the kernel part of the Nouveau driver. Without them you
don't get any acceleration. These are not kernel framebuffer drivers (yet,
at least).
  </pre>
</blockquote>
<br>
But is the original (from the linux kernel tree) driver required to
make things working at all?<br>
<br>
<blockquote cite="mid:20090213211243.60d6955a-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org"
 type="cite">
  <blockquote type="cite">
    <pre wrap="">- x.org drivers (which I've not changed/replaced)
    </pre>
  </blockquote>
  <pre wrap=""><!---->
nouveau_drv.so, required, from git.
  </pre>
</blockquote>
<br>
It is accessed via /dev/dri/card0, right?<br>
<br>
<blockquote cite="mid:20090213211243.60d6955a-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org"
 type="cite">
  <blockquote type="cite">
    <pre wrap="">- mesa drivers - what is their role - I still do not understand.
    </pre>
  </blockquote>
  <pre wrap=""><!---->
3D acceleration. Not in any usable state at this time, and not
included in any Mesa release yet. You can just forget it and enjoy
software OpenGL rendering.
  </pre>
</blockquote>
<br>
Cool! There are already too many things so excluding any of them is
helpful :-)<br>
<br>
Actually I start thinking that I need to look for the linux capable to
start with X on PlayStation3. It can have clues...<br>
</body>
</html>

--------------010008090800010904060201--

--===============0017192974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0017192974==--
