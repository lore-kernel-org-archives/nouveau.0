From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55450] [NV17] nouveau driver fails to restore screen
 content / video mode after resume from s2ram
Date: Wed, 16 Oct 2013 19:20:57 +0000
Message-ID: <bug-55450-8800-TeJrKkLnNp@http.bugs.freedesktop.org/>
References: <bug-55450-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1747098733=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-55450-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1747098733==
Content-Type: multipart/alternative; boundary="1381951256.E85e1.27959"; charset="us-ascii"


--1381951256.E85e1.27959
Date: Wed, 16 Oct 2013 19:20:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55450

--- Comment #14 from Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> ---
Well the problem was that nouveau has gone into my initrd. A simple
NO_KMS_IN_INITRD="yes" followed by an mkinitrd did the trick. However the just
gained test results are not encouraging:
* echo mem >/sys/power/state  without nouveau  -> bluescreen
* echo mem >/sys/power/state  without nouveau and with vga=0  -> funny text
screen flicker

I guess we have to post this as a regression at kernel.org. Will have to find
the last working kernel (uff. so much broken about Linux at the moment). I
guess I would not have reported that as Xorg issue if it were not had been
issue-free in console mode.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381951256.E85e1.27959
Date: Wed, 16 Oct 2013 19:20:56 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - [NV17] nouveau driver fails to restore screen content / video mode after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55450#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV17] nouveau driver fails to restore screen content / video mode after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55450">bug 55450</a>
              from <span class="vcard"><a class="email" href="mailto:estellnb&#64;elstel.org" title="Elmar Stellnberger &lt;estellnb&#64;elstel.org&gt;"> <span class="fn">Elmar Stellnberger</span></a>
</span></b>
        <pre>Well the problem was that nouveau has gone into my initrd. A simple
NO_KMS_IN_INITRD=&quot;yes&quot; followed by an mkinitrd did the trick. However the just
gained test results are not encouraging:
* echo mem &gt;/sys/power/state  without nouveau  -&gt; bluescreen
* echo mem &gt;/sys/power/state  without nouveau and with vga=0  -&gt; funny text
screen flicker

I guess we have to post this as a regression at kernel.org. Will have to find
the last working kernel (uff. so much broken about Linux at the moment). I
guess I would not have reported that as Xorg issue if it were not had been
issue-free in console mode.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381951256.E85e1.27959--

--===============1747098733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1747098733==--
