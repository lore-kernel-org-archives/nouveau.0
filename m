From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75569] New: [nv34] [v3.14-rc3] DMA_PUSHER get
 0x00029044 put 0x000184d0 state 0x80000040 (err: INVALID_CMD) push
 0x00000000
Date: Thu, 27 Feb 2014 11:19:48 +0000
Message-ID: <bug-75569-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1039452136=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1039452136==
Content-Type: multipart/alternative; boundary="1393499988.e3B21.3433"; charset="us-ascii"


--1393499988.e3B21.3433
Date: Thu, 27 Feb 2014 11:19:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75569

          Priority: medium
            Bug ID: 75569
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [nv34] [v3.14-rc3] DMA_PUSHER get 0x00029044 put
                    0x000184d0 state 0x80000040 (err: INVALID_CMD) push
                    0x00000000
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 94807
  --> https://bugs.freedesktop.org/attachment.cgi?id=94807&action=edit
Full dmesg, errors below

I get this occasionally when browsing the web or using Gdocs. I don't know for
sure if this is a regression. The hangs are hard to reproduce and sometimes
don't occur for a long while.

I'm posting a full dmesg with the error.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393499988.e3B21.3433
Date: Thu, 27 Feb 2014 11:19:48 +0000
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
   title="NEW --- - [nv34] [v3.14-rc3] DMA_PUSHER get 0x00029044 put 0x000184d0 state 0x80000040 (err: INVALID_CMD) push 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75569">75569</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nv34] [v3.14-rc3] DMA_PUSHER get 0x00029044 put 0x000184d0 state 0x80000040 (err: INVALID_CMD) push 0x00000000
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
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>ronald645&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
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
        <pre>Created <span class=""><a href="attachment.cgi?id=94807" name="attach_94807" title="Full dmesg, errors below">attachment 94807</a> <a href="attachment.cgi?id=94807&amp;action=edit" title="Full dmesg, errors below">[details]</a></span>
Full dmesg, errors below

I get this occasionally when browsing the web or using Gdocs. I don't know for
sure if this is a regression. The hangs are hard to reproduce and sometimes
don't occur for a long while.

I'm posting a full dmesg with the error.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393499988.e3B21.3433--

--===============1039452136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1039452136==--
