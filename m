From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50121] [Regression] NV34 Fx5200 & NVC3/Quadro 2000M
 both fail to resume with commit 'convert to exec engine,
 and improve channel sync'
Date: Mon, 05 Nov 2012 11:42:07 +0000
Message-ID: <bug-50121-8800-pgvqRV8f6s@http.bugs.freedesktop.org/>
References: <bug-50121-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0648187353=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50121-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0648187353==
Content-Type: multipart/alternative; boundary="1352115727.84f6e52.28093"; charset="us-ascii"


--1352115727.84f6e52.28093
Date: Mon, 5 Nov 2012 11:42:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=50121

--- Comment #17 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Still not working with 3.7-rc4:


nouveau  [     DRM] re-enabling device...
nouveau  [     DRM] resuming client object trees...
nouveau  [   VBIOS][0000:01:00.0] running init tables
nouveau W[  PTIMER][0000:01:00.0] unknown input clock freq
agpgart-via 0000:00:00.0: AGP 3.5 bridge
agpgart: kworker/u:30 tried to set rate=x12. Setting to AGP3 x8 mode.
agpgart-via 0000:00:00.0: putting AGP V3 device into 8x mode
nouveau 0000:01:00.0: putting AGP V3 device into 8x mode
nouveau  [     DRM] Loading NV17 power sequencing microcode
nouveau  [     DRM] resuming display...
nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 1)
Restarting tasks ... done.
nouveau E[     DRM] reloc wait_idle failed: -16
nouveau E[     DRM] reloc apply: -16
nouveau E[     DRM] reloc wait_idle failed: -16
nouveau E[     DRM] reloc apply: -16
nouveau E[     DRM] reloc wait_idle failed: -16
nouveau E[     DRM] reloc apply: -16

Screen stays black on resume. I tested this +nouveau tree which enables
z-compression.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1352115727.84f6e52.28093
Date: Mon, 5 Nov 2012 11:42:07 +0000
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
   title="NEW --- - [Regression] NV34 Fx5200 &amp; NVC3/Quadro 2000M both fail to resume with commit 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [Regression] NV34 Fx5200 &amp; NVC3/Quadro 2000M both fail to resume with commit 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121">bug 50121</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Still not working with 3.7-rc4:


nouveau  [     DRM] re-enabling device...
nouveau  [     DRM] resuming client object trees...
nouveau  [   VBIOS][0000:01:00.0] running init tables
nouveau W[  PTIMER][0000:01:00.0] unknown input clock freq
agpgart-via 0000:00:00.0: AGP 3.5 bridge
agpgart: kworker/u:30 tried to set rate=x12. Setting to AGP3 x8 mode.
agpgart-via 0000:00:00.0: putting AGP V3 device into 8x mode
nouveau 0000:01:00.0: putting AGP V3 device into 8x mode
nouveau  [     DRM] Loading NV17 power sequencing microcode
nouveau  [     DRM] resuming display...
nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 1)
Restarting tasks ... done.
nouveau E[     DRM] reloc wait_idle failed: -16
nouveau E[     DRM] reloc apply: -16
nouveau E[     DRM] reloc wait_idle failed: -16
nouveau E[     DRM] reloc apply: -16
nouveau E[     DRM] reloc wait_idle failed: -16
nouveau E[     DRM] reloc apply: -16

Screen stays black on resume. I tested this +nouveau tree which enables
z-compression.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1352115727.84f6e52.28093--

--===============0648187353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0648187353==--
