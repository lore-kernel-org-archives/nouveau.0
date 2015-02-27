From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 32406] nouveau fails to send hotplug event to ALSA
 hda hdmi audio
Date: Fri, 27 Feb 2015 00:51:30 +0000
Message-ID: <bug-32406-8800-cmtP4tlSP3@http.bugs.freedesktop.org/>
References: <bug-32406-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2058975293=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-32406-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2058975293==
Content-Type: multipart/alternative; boundary="1424998290.d0DDCF7b4.9580"; charset="UTF-8"


--1424998290.d0DDCF7b4.9580
Date: Fri, 27 Feb 2015 00:51:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=32406

--- Comment #9 from Kip Warner <Kip-pQI53ePfAtSt/hvpvFFPbQ@public.gmane.org> ---
Hey Ilia,

I can confirm that this is still an issue. In fact, I noticed it not just with
the Nouveau driver (Ubuntu, amd64, 1:1.0.11+git1411032101.3fb97d~gd~u), but
also with the non-free nVidia 346 driver. 

In both cases the hotplug notification was not being reported by udevadm (and
presumably the kernel hotplug system either via netlink or script driven). The
card in question was an nVidia GeForce GTX 960. 

This may be a hardware issue because plugging in the same HDMI sink (Onkyo
TX-NR535) to my integrated Intel HDMI port emits several hotplug events no
problem on both connect and disconnect.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1424998290.d0DDCF7b4.9580
Date: Fri, 27 Feb 2015 00:51:30 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - nouveau fails to send hotplug event to ALSA hda hdmi audio"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=32406#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - nouveau fails to send hotplug event to ALSA hda hdmi audio"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=32406">bug 32406</a>
              from <span class="vcard"><a class="email" href="mailto:Kip&#64;TheVertigo.com" title="Kip Warner &lt;Kip&#64;TheVertigo.com&gt;"> <span class="fn">Kip Warner</span></a>
</span></b>
        <pre>Hey Ilia,

I can confirm that this is still an issue. In fact, I noticed it not just with
the Nouveau driver (Ubuntu, amd64, 1:1.0.11+git1411032101.3fb97d~gd~u), but
also with the non-free nVidia 346 driver. 

In both cases the hotplug notification was not being reported by udevadm (and
presumably the kernel hotplug system either via netlink or script driven). The
card in question was an nVidia GeForce GTX 960. 

This may be a hardware issue because plugging in the same HDMI sink (Onkyo
TX-NR535) to my integrated Intel HDMI port emits several hotplug events no
problem on both connect and disconnect.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1424998290.d0DDCF7b4.9580--

--===============2058975293==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2058975293==--
