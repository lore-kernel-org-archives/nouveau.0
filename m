From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68665] New: Crashing games when set AA to x2 on
	GTX760
Date: Wed, 28 Aug 2013 14:24:40 +0000
Message-ID: <bug-68665-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0710768036=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0710768036==
Content-Type: multipart/alternative; boundary="1377699880.d2eb20d50.31629"; charset="us-ascii"


--1377699880.d2eb20d50.31629
Date: Wed, 28 Aug 2013 14:24:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68665

          Priority: medium
            Bug ID: 68665
                CC: i.gnatenko.brain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Crashing games when set AA to x2 on GTX760
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: i.gnatenko.brain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 9.2
         Component: Drivers/DRI/nouveau
           Product: Mesa

Version: 9.2

I see many bugreports with this problem:
https://bugzilla.redhat.com/show_bug.cgi?id=1001714
https://bugzilla.redhat.com/show_bug.cgi?id=1001698
https://bugzilla.redhat.com/show_bug.cgi?id=1001740

I see always problem w/ pushbuf_dump. It's crashing w/ SIGSEGV. The same of:
Thread no. 1 (10 frames)
 #0 pushbuf_dump at pushbuf.c:296
 #1 pushbuf_submit at pushbuf.c:361
 #2 pushbuf_flush at pushbuf.c:402
 #3 nouveau_pushbuf_kick at pushbuf.c:773
 #4 PUSH_KICK at ../../../../src/gallium/drivers/nouveau/nouveau_winsys.h:56
 #5 nvc0_flush at nvc0_context.c:45
 #6 st_glFlush at ../../src/mesa/state_tracker/st_cb_flush.c:121
 #7 _mesa_make_current at ../../src/mesa/main/context.c:1455
 #8 st_api_make_current at ../../src/mesa/state_tracker/st_manager.c:737
 #9 dri_unbind_context at dri_context.c:217

All backtraces, some info in links to RHBZ. If you need additional info you're
welcome.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377699880.d2eb20d50.31629
Date: Wed, 28 Aug 2013 14:24:40 +0000
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
   title="NEW --- - Crashing games when set AA to x2 on GTX760"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68665">68665</a>
          </td>
        </tr>

        <tr>
          <th>CC</th>
          <td>i.gnatenko.brain&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Crashing games when set AA to x2 on GTX760
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
          <td>i.gnatenko.brain&#64;gmail.com
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
          <td>9.2
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
        <pre>Version: 9.2

I see many bugreports with this problem:
<a href="https://bugzilla.redhat.com/show_bug.cgi?id=1001714">https://bugzilla.redhat.com/show_bug.cgi?id=1001714</a>
<a href="https://bugzilla.redhat.com/show_bug.cgi?id=1001698">https://bugzilla.redhat.com/show_bug.cgi?id=1001698</a>
<a href="https://bugzilla.redhat.com/show_bug.cgi?id=1001740">https://bugzilla.redhat.com/show_bug.cgi?id=1001740</a>

I see always problem w/ pushbuf_dump. It's crashing w/ SIGSEGV. The same of:
Thread no. 1 (10 frames)
 #0 pushbuf_dump at pushbuf.c:296
 #1 pushbuf_submit at pushbuf.c:361
 #2 pushbuf_flush at pushbuf.c:402
 #3 nouveau_pushbuf_kick at pushbuf.c:773
 #4 PUSH_KICK at ../../../../src/gallium/drivers/nouveau/nouveau_winsys.h:56
 #5 nvc0_flush at nvc0_context.c:45
 #6 st_glFlush at ../../src/mesa/state_tracker/st_cb_flush.c:121
 #7 _mesa_make_current at ../../src/mesa/main/context.c:1455
 #8 st_api_make_current at ../../src/mesa/state_tracker/st_manager.c:737
 #9 dri_unbind_context at dri_context.c:217

All backtraces, some info in links to RHBZ. If you need additional info you're
welcome.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377699880.d2eb20d50.31629--

--===============0710768036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0710768036==--
