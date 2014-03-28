From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76732] Kworker using 100% CPU
Date: Fri, 28 Mar 2014 22:24:02 +0000
Message-ID: <bug-76732-8800-nSeUxMK21F@http.bugs.freedesktop.org/>
References: <bug-76732-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1537830865=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76732-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1537830865==
Content-Type: multipart/alternative; boundary="1396045442.0E7AcA2c1.23396"; charset="us-ascii"


--1396045442.0E7AcA2c1.23396
Date: Fri, 28 Mar 2014 22:24:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76732

--- Comment #21 from patrick.clara-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I tryed again with nouveau.debug=debug and drm.debug=0xe, but this time I added
drm_kms_helper.poll=0.

The dmesg output is the same as without drm_kms_helper.poll=0.
Even these lines are still present:

[   85.722596] [drm:drm_helper_hpd_irq_event], [CONNECTOR:17:eDP-1] status
updated from connected to connected
[   85.723677] [drm:drm_helper_hpd_irq_event], [CONNECTOR:21:HDMI-A-1] status
updated from disconnected to disconnected

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396045442.0E7AcA2c1.23396
Date: Fri, 28 Mar 2014 22:24:02 +0000
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
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732">bug 76732</a>
              from <span class="vcard"><a class="email" href="mailto:patrick.clara&#64;gmail.com" title="patrick.clara&#64;gmail.com">patrick.clara&#64;gmail.com</a>
</span></b>
        <pre>I tryed again with nouveau.debug=debug and drm.debug=0xe, but this time I added
drm_kms_helper.poll=0.

The dmesg output is the same as without drm_kms_helper.poll=0.
Even these lines are still present:

[   85.722596] [drm:drm_helper_hpd_irq_event], [CONNECTOR:17:eDP-1] status
updated from connected to connected
[   85.723677] [drm:drm_helper_hpd_irq_event], [CONNECTOR:21:HDMI-A-1] status
updated from disconnected to disconnected</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396045442.0E7AcA2c1.23396--

--===============1537830865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1537830865==--
