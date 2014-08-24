From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61537] Screen flicker when using display with
	incorrect EDID
Date: Sun, 24 Aug 2014 17:50:07 +0000
Message-ID: <bug-61537-8800-q7EkVCHuVN@http.bugs.freedesktop.org/>
References: <bug-61537-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0801992074=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61537-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0801992074==
Content-Type: multipart/alternative; boundary="1408902607.1aBB3.4449"; charset="us-ascii"


--1408902607.1aBB3.4449
Date: Sun, 24 Aug 2014 17:50:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61537

--- Comment #3 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
A bit of a (hopefully useful) information

 - Whenever drm_kms_helper.poll is disabled, your vga monitor won't get
automatically detected when it's not plugged in at boot.

 - Iirc there are two modes when querying for info via the xrandr protocol -
use cached one or re-probe. 

 - Original nv50 (and earlier?) hardware the blob does a plain sleep/udelay
between setup and probe, while for nv92 and latter it uses a more elaborate
approach (see bug 67382, comment 34). Currently nouveau uses the former method
which contributes (not sure to what extend) to the flicker.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408902607.1aBB3.4449
Date: Sun, 24 Aug 2014 17:50:07 +0000
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
   title="NEW --- - Screen flicker when using display with incorrect EDID"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61537#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Screen flicker when using display with incorrect EDID"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61537">bug 61537</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>A bit of a (hopefully useful) information

 - Whenever drm_kms_helper.poll is disabled, your vga monitor won't get
automatically detected when it's not plugged in at boot.

 - Iirc there are two modes when querying for info via the xrandr protocol -
use cached one or re-probe. 

 - Original nv50 (and earlier?) hardware the blob does a plain sleep/udelay
between setup and probe, while for nv92 and latter it uses a more elaborate
approach (see <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="show_bug.cgi?id=67382#c34">bug 67382, comment 34</a>). Currently nouveau uses the former method
which contributes (not sure to what extend) to the flicker.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408902607.1aBB3.4449--

--===============0801992074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0801992074==--
