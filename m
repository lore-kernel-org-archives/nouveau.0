From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
	rescan
Date: Mon, 10 Mar 2014 16:15:40 +0000
Message-ID: <bug-75985-8800-sx9ohS2Tl0@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1528410323=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75985-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1528410323==
Content-Type: multipart/alternative; boundary="1394468139.305f45e61.17756"; charset="us-ascii"


--1394468139.305f45e61.17756
Date: Mon, 10 Mar 2014 16:15:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75985

--- Comment #2 from Jean-Louis Dupond <jean-louis-h84OYfGOAs2zQB+pC5nmwQ@public.gmane.org> ---
Tested this out.

On Windows:
Both devices not visible in lspci. When you then start a game for example, the
NVIDIA VGA device becomes visible. The audio device not.

Now if you plugin a HDMI cable, both devices (VGA & Audio) becomes visible.

If we now remove the HDMI cable, both devices stay there for a while, and then
get deactivated together.

On Linux:
If we boot with HDMI cable in, same issue.

Now if I do the pci remove/rescan without HDMI cable, same result.
The Audio device becomes visible, even without having a HDMI cable in!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394468139.305f45e61.17756
Date: Mon, 10 Mar 2014 16:15:39 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75985#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] HDMI audio device only visible after rescan"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75985">bug 75985</a>
              from <span class="vcard"><a class="email" href="mailto:jean-louis&#64;dupond.be" title="Jean-Louis Dupond &lt;jean-louis&#64;dupond.be&gt;"> <span class="fn">Jean-Louis Dupond</span></a>
</span></b>
        <pre>Tested this out.

On Windows:
Both devices not visible in lspci. When you then start a game for example, the
NVIDIA VGA device becomes visible. The audio device not.

Now if you plugin a HDMI cable, both devices (VGA &amp; Audio) becomes visible.

If we now remove the HDMI cable, both devices stay there for a while, and then
get deactivated together.

On Linux:
If we boot with HDMI cable in, same issue.

Now if I do the pci remove/rescan without HDMI cable, same result.
The Audio device becomes visible, even without having a HDMI cable in!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394468139.305f45e61.17756--

--===============1528410323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1528410323==--
