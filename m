From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79611] New: [NVC0] TRAP ch 4 [0x003fa28000 bzflag]
Date: Wed, 04 Jun 2014 02:33:24 +0000
Message-ID: <bug-79611-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2133145260=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============2133145260==
Content-Type: multipart/alternative; boundary="1401849204.14DCcdfF0.28035"; charset="us-ascii"


--1401849204.14DCcdfF0.28035
Date: Wed, 4 Jun 2014 02:33:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79611

          Priority: medium
            Bug ID: 79611
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVC0] TRAP ch 4 [0x003fa28000 bzflag]
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: anonymous-IjDkMZObD1hBDgjK7y7TUQ@public.gmane.org
               URL: http://bzflag.org/downloads
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 10.1
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 100377
  --> https://bugs.freedesktop.org/attachment.cgi?id=100377&action=edit
dmesg of nouveau before during and after the crash

Pro-longed play of BZFlag or joining a very popular room for < 30mins where
there are a lot of explosions will cause nouveau to crash. There is brief
jitter followed by a prompt coredump.Attached is the dmesg log and the game for
use as a test case.

I am using the latest 3.14.4 kernel with mesa 10.1 on Arch.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401849204.14DCcdfF0.28035
Date: Wed, 4 Jun 2014 02:33:24 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC0] TRAP ch 4 [0x003fa28000 bzflag]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79611">79611</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVC0] TRAP ch 4 [0x003fa28000 bzflag]
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>anonymous&#64;dodgeit.com
          </td>
        </tr>

        <tr>
          <th>URL</th>
          <td>http://bzflag.org/downloads
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>10.1
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=100377" name="attach_100377" title="dmesg of nouveau before during and after the crash">attachment 100377</a> <a href="attachment.cgi?id=100377&amp;action=edit" title="dmesg of nouveau before during and after the crash">[details]</a></span>
dmesg of nouveau before during and after the crash

Pro-longed play of BZFlag or joining a very popular room for &lt; 30mins where
there are a lot of explosions will cause nouveau to crash. There is brief
jitter followed by a prompt coredump.Attached is the dmesg log and the game for
use as a test case.

I am using the latest 3.14.4 kernel with mesa 10.1 on Arch.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401849204.14DCcdfF0.28035--

--===============2133145260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2133145260==--
