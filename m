From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56340] [Ubuntu 10.04.4 LTS 32-bit] Severe
 instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2
 M64 graphics
Date: Wed, 21 Aug 2013 05:00:07 +0000
Message-ID: <bug-56340-8800-DWW0nyNdvH@http.bugs.freedesktop.org/>
References: <bug-56340-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0369113029=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56340-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0369113029==
Content-Type: multipart/alternative; boundary="1377061207.1f321.5155"; charset="us-ascii"


--1377061207.1f321.5155
Date: Wed, 21 Aug 2013 05:00:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56340

--- Comment #13 from mypersonalmailbox1-O5WfVfzUwx8@public.gmane.org ---
Hi,

A few more updates.
I have obtained Creative Labs Graphics Blaster TNT 16 MB AGP and Diamond
Multimedia Viper 770 32 MB AGP.
They both boot Ubuntu 10.04 LTS 32-bit fine with AGP 2X mode enabled.
In the case of 2 of my NVIDIA RIVA TNT2 M64 cards that cause the freezes, from
time to time, they do get through the boot process if I switch to text display
mode during boot (as opposed to Ubuntu logo with red dots flashing), but it is
not perfect (meaning, I do still get freezes even with this workaround).
Based on this, I think the bug is not hardware in nature, and it appears to be
device driver bug (i.e., software) related.
Please note that Creative Labs Graphics Blaster TNT is based on RIVA TNT (NV4),
and is older than RIVA TNT2 M64.

Regards,

fpgahardwareengineer

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377061207.1f321.5155
Date: Wed, 21 Aug 2013 05:00:07 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [Ubuntu 10.04.4 LTS 32-bit] Severe instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2 M64 graphics"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56340#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [Ubuntu 10.04.4 LTS 32-bit] Severe instability of VIA Technologies Apollo MVP3 chipset and NVIDIA RIVA TNT2 M64 graphics"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56340">bug 56340</a>
              from <span class="vcard"><a class="email" href="mailto:mypersonalmailbox1&#64;mail.com" title="mypersonalmailbox1&#64;mail.com">mypersonalmailbox1&#64;mail.com</a>
</span></b>
        <pre>Hi,

A few more updates.
I have obtained Creative Labs Graphics Blaster TNT 16 MB AGP and Diamond
Multimedia Viper 770 32 MB AGP.
They both boot Ubuntu 10.04 LTS 32-bit fine with AGP 2X mode enabled.
In the case of 2 of my NVIDIA RIVA TNT2 M64 cards that cause the freezes, from
time to time, they do get through the boot process if I switch to text display
mode during boot (as opposed to Ubuntu logo with red dots flashing), but it is
not perfect (meaning, I do still get freezes even with this workaround).
Based on this, I think the bug is not hardware in nature, and it appears to be
device driver bug (i.e., software) related.
Please note that Creative Labs Graphics Blaster TNT is based on RIVA TNT (NV4),
and is older than RIVA TNT2 M64.

Regards,

fpgahardwareengineer</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377061207.1f321.5155--

--===============0369113029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0369113029==--
