From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78748] Nouveau fails initializing KMS on Geforce2 Go
	(NV11M)
Date: Thu, 15 May 2014 17:00:55 +0000
Message-ID: <bug-78748-8800-NR5fBQXjg2@http.bugs.freedesktop.org/>
References: <bug-78748-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1612960450=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78748-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1612960450==
Content-Type: multipart/alternative; boundary="1400173255.AEae702.29728"; charset="us-ascii"


--1400173255.AEae702.29728
Date: Thu, 15 May 2014 17:00:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78748

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
My investigation of this led to mode being null. I guess I would have expected
bios->fp_no_ddc to be set, but it wasn't. Will look at the attached vbios.

A workaround for now would be to change

drivers/gpu/drm/nouveau/nouveau_connector.c:nouveau_connector_detect_depth

        /* LVDS: panel straps */
        if (bios->fp_no_ddc) {
                if (bios->fp.if_is_24bit)
                        connector->display_info.bpc = 8;
                return;
        }

to be

        /* LVDS: panel straps */
        if (1 || bios->fp_no_ddc) {
                if (bios->fp.if_is_24bit)
                        connector->display_info.bpc = 8;
                return;
        }

Which will force it down this path. Alternatively you could change

                duallink = mode->clock >= bios->fp.duallink_transition_clk;

to be

                duallink = mode && mode->clock >=
bios->fp.duallink_transition_clk;

Which would also avoid the crash.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1400173255.AEae702.29728
Date: Thu, 15 May 2014 17:00:55 +0000
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
   title="NEW --- - Nouveau fails initializing KMS on Geforce2 Go (NV11M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78748#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau fails initializing KMS on Geforce2 Go (NV11M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78748">bug 78748</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>My investigation of this led to mode being null. I guess I would have expected
bios-&gt;fp_no_ddc to be set, but it wasn't. Will look at the attached vbios.

A workaround for now would be to change

drivers/gpu/drm/nouveau/nouveau_connector.c:nouveau_connector_detect_depth

        /* LVDS: panel straps */
        if (bios-&gt;fp_no_ddc) {
                if (bios-&gt;fp.if_is_24bit)
                        connector-&gt;display_info.bpc = 8;
                return;
        }

to be

        /* LVDS: panel straps */
        if (1 || bios-&gt;fp_no_ddc) {
                if (bios-&gt;fp.if_is_24bit)
                        connector-&gt;display_info.bpc = 8;
                return;
        }

Which will force it down this path. Alternatively you could change

                duallink = mode-&gt;clock &gt;= bios-&gt;fp.duallink_transition_clk;

to be

                duallink = mode &amp;&amp; mode-&gt;clock &gt;=
bios-&gt;fp.duallink_transition_clk;

Which would also avoid the crash.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1400173255.AEae702.29728--

--===============1612960450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1612960450==--
