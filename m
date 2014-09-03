From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82835] [NV92] GeForce 8800 GS VDPAU h264 decoding
	hang
Date: Wed, 03 Sep 2014 03:35:16 +0000
Message-ID: <bug-82835-8800-KG8Wg4Ppw0@http.bugs.freedesktop.org/>
References: <bug-82835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1440079855=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82835-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1440079855==
Content-Type: multipart/alternative; boundary="1409715316.Ec4edff2.15288"; charset="us-ascii"


--1409715316.Ec4edff2.15288
Date: Wed, 3 Sep 2014 03:35:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82835

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #9)
> Yes, I can confirm new dmesg still contain mentioned  value:
> 
> root@slax:~# cat nv92_dmesg_new_1.log | grep 0x1000f010
> nouveau E[  PGRAPH][0000:05:00.0] ch 4 [0x00178fb000 mplayer[4559]] subc 3
> class 0x8297 mthd 0x1b0c data 0x1000f010
> nouveau E[  PGRAPH][0000:05:00.0] ch 4 [0x00178fb000 mplayer[4559]] subc 3
> class 0x8297 mthd 0x1b0c data 0x1000f010
> root@slax:~#

OK, and just to confirm... you're *sure* your new libvdpau_nouveau.so is being
used? You can check by doing e.g. "strace -f -e open vdpauinfo" to see which
file it's opening. Judging by your config log, it should be reading
/usr/X11R7/lib/vdpau/libvdpau_nouveau.so.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409715316.Ec4edff2.15288
Date: Wed, 3 Sep 2014 03:35:16 +0000
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
   title="NEW --- - [NV92] GeForce 8800 GS VDPAU h264 decoding hang"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82835#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] GeForce 8800 GS VDPAU h264 decoding hang"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82835">bug 82835</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=82835#c9">comment #9</a>)
<span class="quote">&gt; Yes, I can confirm new dmesg still contain mentioned  value:
&gt; 
&gt; root&#64;slax:~# cat nv92_dmesg_new_1.log | grep 0x1000f010
&gt; nouveau E[  PGRAPH][0000:05:00.0] ch 4 [0x00178fb000 mplayer[4559]] subc 3
&gt; class 0x8297 mthd 0x1b0c data 0x1000f010
&gt; nouveau E[  PGRAPH][0000:05:00.0] ch 4 [0x00178fb000 mplayer[4559]] subc 3
&gt; class 0x8297 mthd 0x1b0c data 0x1000f010
&gt; root&#64;slax:~#</span >

OK, and just to confirm... you're *sure* your new libvdpau_nouveau.so is being
used? You can check by doing e.g. &quot;strace -f -e open vdpauinfo&quot; to see which
file it's opening. Judging by your config log, it should be reading
/usr/X11R7/lib/vdpau/libvdpau_nouveau.so.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409715316.Ec4edff2.15288--

--===============1440079855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1440079855==--
