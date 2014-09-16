From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
	rescan
Date: Tue, 16 Sep 2014 06:33:28 +0000
Message-ID: <bug-75985-8800-yBCfNsJMK9@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1985189887=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75985-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1985189887==
Content-Type: multipart/alternative; boundary="1410849208.10cAF61.17141"; charset="us-ascii"


--1410849208.10cAF61.17141
Date: Tue, 16 Sep 2014 06:33:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75985

--- Comment #6 from Jethro Beekman <freedesktop-bugs-LmnypSVwBK6EVqv0pETR8A@public.gmane.org> ---
Nevermind, the workaround lists the device, and ALSA/Pulse seem to recognize
the device, but no audio gets through. I need to do more debugging.

I found this patch, it seems relevant:
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-3.18&id=cc2a9071458254cb0db6153811734750da0233ea

FYI the nouveau driver doesn't actually output any graphics on my machine (see
https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/1292036
), I'm just here to get audio working ;)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1410849208.10cAF61.17141
Date: Tue, 16 Sep 2014 06:33:28 +0000
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
   title="NEW --- - [NVC1] HDMI audio device only visible after rescan"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75985#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] HDMI audio device only visible after rescan"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75985">bug 75985</a>
              from <span class="vcard"><a class="email" href="mailto:freedesktop-bugs&#64;jbeekman.nl" title="Jethro Beekman &lt;freedesktop-bugs&#64;jbeekman.nl&gt;"> <span class="fn">Jethro Beekman</span></a>
</span></b>
        <pre>Nevermind, the workaround lists the device, and ALSA/Pulse seem to recognize
the device, but no audio gets through. I need to do more debugging.

I found this patch, it seems relevant:
<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-3.18&amp;id=cc2a9071458254cb0db6153811734750da0233ea">http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-3.18&amp;id=cc2a9071458254cb0db6153811734750da0233ea</a>

FYI the nouveau driver doesn't actually output any graphics on my machine (see
<a href="https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/1292036">https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/1292036</a>
), I'm just here to get audio working ;)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1410849208.10cAF61.17141--

--===============1985189887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1985189887==--
