From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31122] Cannot control backlight intensity on
	Powerbook
Date: Sat, 31 Aug 2013 02:51:06 +0000
Message-ID: <bug-31122-8800-98hkSvRt6x@http.bugs.freedesktop.org/>
References: <bug-31122-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1799711411=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31122-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1799711411==
Content-Type: multipart/alternative; boundary="1377917466.b2ddFCDb3.24060"; charset="us-ascii"


--1377917466.b2ddFCDb3.24060
Date: Sat, 31 Aug 2013 02:51:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=31122

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
What do the Fn+X keys do? I assume they just act as a keypress? (And I'm
guessing that the nv driver hooks into that somehow... although the only
reference to 10f0 that I see is in turning the thing on/off, perhaps it just
leaves something untouched that nouveau touches and messes up.)

This should be fairly easy to implement... You know what register to control,
what the min/max are. I'm guessing it's just 10f0 that matters -- the other
register controls whether the CRTC is on/off.

It should be easy to stick something into nouveau_backlight.c that deals with
your sitation. Instead of keying off of card family, you'd key off of
dev->pci_device, like dfp.c:nv04_dfp_update_backlight does. You should give it
a shot if you're interested.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377917466.b2ddFCDb3.24060
Date: Sat, 31 Aug 2013 02:51:06 +0000
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
   title="NEW --- - Cannot control backlight intensity on Powerbook"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=31122#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Cannot control backlight intensity on Powerbook"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=31122">bug 31122</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>What do the Fn+X keys do? I assume they just act as a keypress? (And I'm
guessing that the nv driver hooks into that somehow... although the only
reference to 10f0 that I see is in turning the thing on/off, perhaps it just
leaves something untouched that nouveau touches and messes up.)

This should be fairly easy to implement... You know what register to control,
what the min/max are. I'm guessing it's just 10f0 that matters -- the other
register controls whether the CRTC is on/off.

It should be easy to stick something into nouveau_backlight.c that deals with
your sitation. Instead of keying off of card family, you'd key off of
dev-&gt;pci_device, like dfp.c:nv04_dfp_update_backlight does. You should give it
a shot if you're interested.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377917466.b2ddFCDb3.24060--

--===============1799711411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1799711411==--
