From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 41114] nouveau module crashes on boot
Date: Thu, 03 Jan 2013 03:37:02 +0000
Message-ID: <bug-41114-8800-LrbCj92ObN@http.bugs.freedesktop.org/>
References: <bug-41114-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0039864128=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-41114-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0039864128==
Content-Type: multipart/alternative; boundary="1357184222.E1fEC25.1346"; charset="us-ascii"


--1357184222.E1fEC25.1346
Date: Thu, 3 Jan 2013 03:37:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=41114

--- Comment #15 from Robert Riches <rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org> ---
Unfortunately, installed Mageia 2 doesn't work properly with Nouveau and the
ENGTX560 DC/2DI/1GD5 card.  According to observation and dmesg timestamps, the
kernel appears to go out to lunch for about four minutes.  Later, when
attempting startx, keyboard input becomes extremely unresponsive, and video
output is blacked out.  This is with kernel 3.3.8-desktop-2.mga2.  The same
installation and kernel work well with an ENGT430 card.  What information
(dmesg, Xorg log) would be useful?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1357184222.E1fEC25.1346
Date: Thu, 3 Jan 2013 03:37:02 +0000
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
   title="NEW --- - nouveau module crashes on boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=41114#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau module crashes on boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=41114">bug 41114</a>
              from <span class="vcard"><a class="email" href="mailto:rm.riches&#64;jacob21819.net" title="Robert Riches &lt;rm.riches&#64;jacob21819.net&gt;"> <span class="fn">Robert Riches</span></a>
</span></b>
        <pre>Unfortunately, installed Mageia 2 doesn't work properly with Nouveau and the
ENGTX560 DC/2DI/1GD5 card.  According to observation and dmesg timestamps, the
kernel appears to go out to lunch for about four minutes.  Later, when
attempting startx, keyboard input becomes extremely unresponsive, and video
output is blacked out.  This is with kernel 3.3.8-desktop-2.mga2.  The same
installation and kernel work well with an ENGT430 card.  What information
(dmesg, Xorg log) would be useful?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1357184222.E1fEC25.1346--

--===============0039864128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0039864128==--
