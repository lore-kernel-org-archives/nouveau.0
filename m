From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Fri, 19 Jul 2013 17:06:03 +0000
Message-ID: <bug-67051-8800-ysR3H8AJnk@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0991959809=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67051-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0991959809==
Content-Type: multipart/alternative; boundary="1374253563.cAABC40.15913"; charset="us-ascii"


--1374253563.cAABC40.15913
Date: Fri, 19 Jul 2013 17:06:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #21 from Alex <alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I've exhausted all new 3.10.1 combinations (see below).
All have a clean, complete card1/eld#3.0 now but NONE has HDMI SOUND.

1.  hdmi-1 + hdminva3-patch
2.  hdmi-1 + hdmi-2 + hdminva3-patch
3.  hdmi-1 + hdmi-2
4.  hdmi-1

Please note that I repeatedly checked if there still was HDMI SOUND on 3.7.0
(on the possibility that, say, the cat ate the cable in the interim - I don't
have a cat, BTW :).

There must still be something, somewhere missing from the original, good 3.7.0
logic.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374253563.cAABC40.15913
Date: Fri, 19 Jul 2013 17:06:03 +0000
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
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:alupu01&#64;gmail.com" title="Alex &lt;alupu01&#64;gmail.com&gt;"> <span class="fn">Alex</span></a>
</span></b>
        <pre>I've exhausted all new 3.10.1 combinations (see below).
All have a clean, complete card1/eld#3.0 now but NONE has HDMI SOUND.

1.  hdmi-1 + hdminva3-patch
2.  hdmi-1 + hdmi-2 + hdminva3-patch
3.  hdmi-1 + hdmi-2
4.  hdmi-1

Please note that I repeatedly checked if there still was HDMI SOUND on 3.7.0
(on the possibility that, say, the cat ate the cable in the interim - I don't
have a cat, BTW :).

There must still be something, somewhere missing from the original, good 3.7.0
logic.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374253563.cAABC40.15913--

--===============0991959809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0991959809==--
