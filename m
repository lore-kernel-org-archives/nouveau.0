From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77946] New: watchdog_overflow_callback hard CPU
	lockup
Date: Fri, 25 Apr 2014 21:54:33 +0000
Message-ID: <bug-77946-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0880517962=="
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


--===============0880517962==
Content-Type: multipart/alternative; boundary="1398462873.FafA1.22516"; charset="us-ascii"


--1398462873.FafA1.22516
Date: Fri, 25 Apr 2014 21:54:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77946

          Priority: medium
            Bug ID: 77946
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: watchdog_overflow_callback hard CPU lockup
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: redafroman22-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 97999
  --> https://bugs.freedesktop.org/attachment.cgi?id=97999&action=edit
dmesg log output

I recently upgrade an Ubuntu 12.04 server OS to Ubuntu 14.04 server, kernel
3.13. My machine began locking up during SSH sessions; sometime it'd unlock and
others I just had to hard reboot the computer. I was able to get a dmesg output
that mentioned nouveau_therm_fan_set quite a bit (forgive me if I'm reading the
dump incorrectly). 

I wasn't having any trouble on 3.2 or 3.8 kernels, and I have done a clean
install of 14.04 server with the same problem.

Output from dmesg of the trace on a clean install is attached.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398462873.FafA1.22516
Date: Fri, 25 Apr 2014 21:54:33 +0000
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
   title="NEW --- - watchdog_overflow_callback hard CPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77946">77946</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>watchdog_overflow_callback hard CPU lockup
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
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
          <td>redafroman22&#64;yahoo.com
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
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=97999" name="attach_97999" title="dmesg log output">attachment 97999</a> <a href="attachment.cgi?id=97999&amp;action=edit" title="dmesg log output">[details]</a></span>
dmesg log output

I recently upgrade an Ubuntu 12.04 server OS to Ubuntu 14.04 server, kernel
3.13. My machine began locking up during SSH sessions; sometime it'd unlock and
others I just had to hard reboot the computer. I was able to get a dmesg output
that mentioned nouveau_therm_fan_set quite a bit (forgive me if I'm reading the
dump incorrectly). 

I wasn't having any trouble on 3.2 or 3.8 kernels, and I have done a clean
install of 14.04 server with the same problem.

Output from dmesg of the trace on a clean install is attached.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398462873.FafA1.22516--

--===============0880517962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0880517962==--
