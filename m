From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70452] [NV43] Graphical corruption after resume from
 suspend or hibernation
Date: Tue, 26 Nov 2013 08:17:57 +0000
Message-ID: <bug-70452-8800-AOHe5WU60U@http.bugs.freedesktop.org/>
References: <bug-70452-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0572487369=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70452-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0572487369==
Content-Type: multipart/alternative; boundary="1385453877.D3DD1.732"; charset="us-ascii"


--1385453877.D3DD1.732
Date: Tue, 26 Nov 2013 08:17:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70452

--- Comment #5 from Moi Jaiunvelo <moijaiunvelo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi,
I ignore against which gcc version my libdrm was compiled but my libdrm
version is 2.4.46-3 (I run debian/testing) :

Versions of packages xserver-xorg-video-nouveau depends on:
ii  libc6                                  2.17-93
ii  libdrm-nouveau2                        2.4.46-3
ii  libdrm2                                2.4.46-3
ii  libudev1                               204-5
ii  xserver-xorg-core [xorg-video-abi-14]  2:1.14.3-3

I am going to backport the 2.4.49-1 from debian/sid to test your guess.

Thanks for your reply,
Moi


2013/11/26 <bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>

>   *Comment # 4 <https://bugs.freedesktop.org/show_bug.cgi?id=70452#c4> on
> bug 70452 <https://bugs.freedesktop.org/show_bug.cgi?id=70452> from Ilia
> Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> *
>
> Was your libdrm compiled with gcc-4.8? If so, make sure to get libdrm 2.4.48 or
> later.
>
>  ------------------------------
> You are receiving this mail because:
>
>    - You are on the CC list for the bug.
>    - You reported the bug.
>
>

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385453877.D3DD1.732
Date: Tue, 26 Nov 2013 08:17:57 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV43] Graphical corruption after resume from suspend or hibernation"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70452#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV43] Graphical corruption after resume from suspend or hibernation"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70452">bug 70452</a>
              from <span class="vcard"><a class="email" href="mailto:moijaiunvelo&#64;gmail.com" title="Moi Jaiunvelo &lt;moijaiunvelo&#64;gmail.com&gt;"> <span class="fn">Moi Jaiunvelo</span></a>
</span></b>
        <pre>Hi,
I ignore against which gcc version my libdrm was compiled but my libdrm
version is 2.4.46-3 (I run debian/testing) :

Versions of packages xserver-xorg-video-nouveau depends on:
ii  libc6                                  2.17-93
ii  libdrm-nouveau2                        2.4.46-3
ii  libdrm2                                2.4.46-3
ii  libudev1                               204-5
ii  xserver-xorg-core [xorg-video-abi-14]  2:1.14.3-3

I am going to backport the 2.4.49-1 from debian/sid to test your guess.

Thanks for your reply,
Moi


2013/11/26 &lt;<a href="mailto:bugzilla-daemon&#64;freedesktop.org">bugzilla-daemon&#64;freedesktop.org</a>&gt;

<span class="quote">&gt;   *<a href="show_bug.cgi?id=70452#c4">Comment # 4</a> &lt;<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV43] Graphical corruption after resume from suspend or hibernation"
   href="show_bug.cgi?id=70452#c4">https://bugs.freedesktop.org/show_bug.cgi?id=70452#c4</a>&gt; on
&gt; <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV43] Graphical corruption after resume from suspend or hibernation"
   href="show_bug.cgi?id=70452">bug 70452</a> &lt;<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV43] Graphical corruption after resume from suspend or hibernation"
   href="show_bug.cgi?id=70452">https://bugs.freedesktop.org/show_bug.cgi?id=70452</a>&gt; from Ilia
&gt; Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt; *</span >
&gt;
<span class="quote">&gt; Was your libdrm compiled with gcc-4.8? If so, make sure to get libdrm 2.4.48 or
&gt; later.</span >
&gt;
<span class="quote">&gt;  ------------------------------
&gt; You are receiving this mail because:</span >
&gt;
<span class="quote">&gt;    - You are on the CC list for the bug.
&gt;    - You reported the bug.</span >
&gt;
&gt;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385453877.D3DD1.732--

--===============0572487369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0572487369==--
