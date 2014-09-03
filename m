From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82835] [NV92] GeForce 8800 GS VDPAU h264 decoding
	hang
Date: Wed, 03 Sep 2014 01:57:05 +0000
Message-ID: <bug-82835-8800-j93HlFZnsD@http.bugs.freedesktop.org/>
References: <bug-82835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1737991286=="
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


--===============1737991286==
Content-Type: multipart/alternative; boundary="1409709425.d0F8F11.21342"; charset="us-ascii"


--1409709425.d0F8F11.21342
Date: Wed, 3 Sep 2014 01:57:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82835

--- Comment #9 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org> ---
Yes, I can confirm new dmesg still contain mentioned  value:

root@slax:~# cat nv92_dmesg_new_1.log | grep 0x1000f010
nouveau E[  PGRAPH][0000:05:00.0] ch 4 [0x00178fb000 mplayer[4559]] subc 3
class 0x8297 mthd 0x1b0c data 0x1000f010
nouveau E[  PGRAPH][0000:05:00.0] ch 4 [0x00178fb000 mplayer[4559]] subc 3
class 0x8297 mthd 0x1b0c data 0x1000f010
root@slax:~#

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409709425.d0F8F11.21342
Date: Wed, 3 Sep 2014 01:57:05 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82835#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] GeForce 8800 GS VDPAU h264 decoding hang"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82835">bug 82835</a>
              from <span class="vcard"><a class="email" href="mailto:randrik&#64;mail.ru" title="Andrew Randrianasulu &lt;randrik&#64;mail.ru&gt;"> <span class="fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>Yes, I can confirm new dmesg still contain mentioned  value:

root&#64;slax:~# cat nv92_dmesg_new_1.log | grep 0x1000f010
nouveau E[  PGRAPH][0000:05:00.0] ch 4 [0x00178fb000 mplayer[4559]] subc 3
class 0x8297 mthd 0x1b0c data 0x1000f010
nouveau E[  PGRAPH][0000:05:00.0] ch 4 [0x00178fb000 mplayer[4559]] subc 3
class 0x8297 mthd 0x1b0c data 0x1000f010
root&#64;slax:~#</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409709425.d0F8F11.21342--

--===============1737991286==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1737991286==--
