From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63135] [NV96] [bisected] DisplayPort dual-head fails
 to switch to KMS
Date: Wed, 05 Feb 2014 02:41:48 +0000
Message-ID: <bug-63135-8800-G8JmduqO9b@http.bugs.freedesktop.org/>
References: <bug-63135-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1473014047=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-63135-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1473014047==
Content-Type: multipart/alternative; boundary="1391568108.c70eB7C1.24174"; charset="us-ascii"


--1391568108.c70eB7C1.24174
Date: Wed, 5 Feb 2014 02:41:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63135

--- Comment #24 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Would you mind testing this again with 3.13.x? A few fixes went in, especially
one that fixes errors setting up displays in NV96 VBIOSes (for HDMI, but your
case could be similar).

Assuming it still doesn't work help, could you attach a boot (from 3.13.x) with
nouveau.debug=PDISP=debug,VBIOS=trace ?

Also, could attach a boot from a good kernel (not necessarily the last good
rev) with nouveau.debug=debug drm.debug=0xe (this should cause a VBIOS trace
from that kernel as well... if it doesn't, I'll have to go back and re-check
the kernel parameters for the older version).

(This is banking on something being different wrt the vbios, either execution
path or perhaps when/how often it is invoked.)

Curiously I don't see any opcode 0x44 in your VBIOS. But I think there are some
tables I'm actually missing, so perhaps it's there. That's definitely an
unknown opcode though -- old or new kernels.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391568108.c70eB7C1.24174
Date: Wed, 5 Feb 2014 02:41:48 +0000
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
   title="NEW --- - [NV96] [bisected] DisplayPort dual-head fails to switch to KMS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63135#c24">Comment # 24</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] [bisected] DisplayPort dual-head fails to switch to KMS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63135">bug 63135</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Would you mind testing this again with 3.13.x? A few fixes went in, especially
one that fixes errors setting up displays in NV96 VBIOSes (for HDMI, but your
case could be similar).

Assuming it still doesn't work help, could you attach a boot (from 3.13.x) with
nouveau.debug=PDISP=debug,VBIOS=trace ?

Also, could attach a boot from a good kernel (not necessarily the last good
rev) with nouveau.debug=debug drm.debug=0xe (this should cause a VBIOS trace
from that kernel as well... if it doesn't, I'll have to go back and re-check
the kernel parameters for the older version).

(This is banking on something being different wrt the vbios, either execution
path or perhaps when/how often it is invoked.)

Curiously I don't see any opcode 0x44 in your VBIOS. But I think there are some
tables I'm actually missing, so perhaps it's there. That's definitely an
unknown opcode though -- old or new kernels.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391568108.c70eB7C1.24174--

--===============1473014047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1473014047==--
