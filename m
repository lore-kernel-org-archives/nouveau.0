From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95282] New: system hang on video playback via vdpau
Date: Thu, 05 May 2016 09:21:24 +0000
Message-ID: <bug-95282-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0618520938=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0618520938==
Content-Type: multipart/alternative; boundary="14624400841.D9a6263.14457";
 charset="UTF-8"


--14624400841.D9a6263.14457
Date: Thu, 5 May 2016 09:21:24 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95282

            Bug ID: 95282
           Summary: system hang on video playback via vdpau
           Product: xorg
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Yesterday I have installed the proprietary firmware for nouveau as described
under wiki/VideoAcceleration/#firmware and now my machine hangs reliably on
start of video playback. If vdpau is not used (i.e. by specifying xine -V XShm
xy.mkv) then it does not hang. It first starts to hang, then there is a short
moment where it reacts on pressing num lock and where playback continues and
then it hangs forever.
  When switching to vt02 before playback starts you can see several messages;
it also reacts on Alt-PrnScr-l/m/p printing out that it would now print the
memory/registers/backtraces but then does not actually print them unless you
presss Alt-PrnScr-C. There appears to be nothing in the log (switched to vt02
is the last message in the xorg.0.log).

Current Operating System: Linux AmiloXi3650 4.6.0-rc6-ARCH-00006-g7d92f59 #8
SMP PREEMPT Tue May 3 14:17:04 CEST 2016 x86_64
Xorg Build Date: 05 April 2016  05:24:02PM

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14624400841.D9a6263.14457
Date: Thu, 5 May 2016 09:21:24 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - system hang on video playback via vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95282">95282</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>system hang on video playback via vdpau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>estellnb&#64;elstel.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Yesterday I have installed the proprietary firmware for nouveau as described
under wiki/VideoAcceleration/#firmware and now my machine hangs reliably on
start of video playback. If vdpau is not used (i.e. by specifying xine -V XShm
xy.mkv) then it does not hang. It first starts to hang, then there is a short
moment where it reacts on pressing num lock and where playback continues and
then it hangs forever.
  When switching to vt02 before playback starts you can see several messages;
it also reacts on Alt-PrnScr-l/m/p printing out that it would now print the
memory/registers/backtraces but then does not actually print them unless you
presss Alt-PrnScr-C. There appears to be nothing in the log (switched to vt02
is the last message in the xorg.0.log).

Current Operating System: Linux AmiloXi3650 4.6.0-rc6-ARCH-00006-g7d92f59 #8
SMP PREEMPT Tue May 3 14:17:04 CEST 2016 x86_64
Xorg Build Date: 05 April 2016  05:24:02PM</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14624400841.D9a6263.14457--

--===============0618520938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0618520938==--
