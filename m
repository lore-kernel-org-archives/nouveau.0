From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] New: Latest 4.6rc4 kernel,
	no booting on gtx970
Date: Mon, 18 Apr 2016 13:51:38 +0000
Message-ID: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1703731501=="
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


--===============1703731501==
Content-Type: multipart/alternative; boundary="14609874981.3De54e7.14149";
 charset="UTF-8"


--14609874981.3De54e7.14149
Date: Mon, 18 Apr 2016 13:51:38 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94990

            Bug ID: 94990
           Summary: Latest 4.6rc4 kernel, no booting on gtx970
           Product: xorg
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: mirkoroller-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 123026
  --> https://bugs.freedesktop.org/attachment.cgi?id=123026&action=edit
dmesg

Hi.... Iam testing the latest 4.6rc4 kernel and the nouveau kernel module. I
installed the latest /lib/firmware from git.   After rebooting, screen goes
black, monitor goes to sleep.

Hardware ASUS Z97 Mainboard
Nvidia GTX970


    2.587816] nouveau 0000:01:00.0: fifo: read fault at 00ffba0000 engine 1f []
client 12 [PMU] reason 0d [REGION_VIOLATION] on channel -1 [0000000000 unknown]
[    2.687724] nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/subdev/secboot/base.c:145/nvkm_secboot_falcon_run()!
[    2.687736] nouveau 0000:01:00.0: fifo: write fault at 000030d000 engine 05
[BAR3] client 08 [HOST_CPU_NB] reason 0d [REGION_VIOLATION] on channel -1
[00ffbf5000 unknown]
[    2.687752] nouveau 0000:01:00.0: fifo: write fault at 0000011000 engine 05
[BAR3] client 08 [HOST_CPU_NB] reason 0d [REGION_VIOLATION] on channel -1
[00ffbf5000 unknown]


Full dmesg output:
http://pastebin.com/pWD1wuTL

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14609874981.3De54e7.14149
Date: Mon, 18 Apr 2016 13:51:38 +0000
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
   title="NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94990">94990</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Latest 4.6rc4 kernel, no booting on gtx970
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
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
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
          <td>mirkoroller&#64;googlemail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=123026" name="attach_123026" title="dmesg">attachment 123026</a> <a href="attachment.cgi?id=123026&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

Hi.... Iam testing the latest 4.6rc4 kernel and the nouveau kernel module. I
installed the latest /lib/firmware from git.   After rebooting, screen goes
black, monitor goes to sleep.

Hardware ASUS Z97 Mainboard
Nvidia GTX970


    2.587816] nouveau 0000:01:00.0: fifo: read fault at 00ffba0000 engine 1f []
client 12 [PMU] reason 0d [REGION_VIOLATION] on channel -1 [0000000000 unknown]
[    2.687724] nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/subdev/secboot/base.c:145/nvkm_secboot_falcon_run()!
[    2.687736] nouveau 0000:01:00.0: fifo: write fault at 000030d000 engine 05
[BAR3] client 08 [HOST_CPU_NB] reason 0d [REGION_VIOLATION] on channel -1
[00ffbf5000 unknown]
[    2.687752] nouveau 0000:01:00.0: fifo: write fault at 0000011000 engine 05
[BAR3] client 08 [HOST_CPU_NB] reason 0d [REGION_VIOLATION] on channel -1
[00ffbf5000 unknown]


Full dmesg output:
<a href="http://pastebin.com/pWD1wuTL">http://pastebin.com/pWD1wuTL</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14609874981.3De54e7.14149--

--===============1703731501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1703731501==--
