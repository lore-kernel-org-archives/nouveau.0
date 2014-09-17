From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83992] New: [NVE0][NVF1] regression,
 linux 3.17 causes gpu lockups
Date: Wed, 17 Sep 2014 13:06:33 +0000
Message-ID: <bug-83992-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0439142858=="
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


--===============0439142858==
Content-Type: multipart/alternative; boundary="1410959193.2fCBeDAA1.4300"; charset="us-ascii"


--1410959193.2fCBeDAA1.4300
Date: Wed, 17 Sep 2014 13:06:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83992

          Priority: medium
            Bug ID: 83992
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVE0][NVF1] regression, linux 3.17 causes gpu lockups
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: tomenglund26-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 106428
  --> https://bugs.freedesktop.org/attachment.cgi?id=106428&action=edit
dmesg of cs:go lockup

im getting a regression with 3.17 gpu lockups instantly i launch wine/cs:go and
at random times with just normal X usage. i bisected the kernel twice and ended
up on same commit
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=f331a15f84a94dce6f12cf0b7012174b4a6bf804 

this is on a 780ti.

attaching dmesg of wine/csgo lockup on 3.17-rc5 and X lockup with the bisected
kernel at that commit.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1410959193.2fCBeDAA1.4300
Date: Wed, 17 Sep 2014 13:06:33 +0000
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
   title="NEW --- - [NVE0][NVF1] regression, linux 3.17 causes gpu lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83992">83992</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE0][NVF1] regression, linux 3.17 causes gpu lockups
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
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
          <td>tomenglund26&#64;gmail.com
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
          <td>git
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
        <pre>Created <span class=""><a href="attachment.cgi?id=106428" name="attach_106428" title="dmesg of cs:go lockup">attachment 106428</a> <a href="attachment.cgi?id=106428&amp;action=edit" title="dmesg of cs:go lockup">[details]</a></span>
dmesg of cs:go lockup

im getting a regression with 3.17 gpu lockups instantly i launch wine/cs:go and
at random times with just normal X usage. i bisected the kernel twice and ended
up on same commit
<a href="http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=f331a15f84a94dce6f12cf0b7012174b4a6bf804">http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=f331a15f84a94dce6f12cf0b7012174b4a6bf804</a> 

this is on a 780ti.

attaching dmesg of wine/csgo lockup on 3.17-rc5 and X lockup with the bisected
kernel at that commit.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1410959193.2fCBeDAA1.4300--

--===============0439142858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0439142858==--
