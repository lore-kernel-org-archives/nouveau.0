From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73473] New: Potential crash bug in
 src/gallium/auxiliary/rtasm/rtasm_execmem.c
Date: Fri, 10 Jan 2014 13:47:01 +0000
Message-ID: <bug-73473-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1944323219=="
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


--===============1944323219==
Content-Type: multipart/alternative; boundary="1389361621.bD8Bf0.28454"; charset="us-ascii"


--1389361621.bD8Bf0.28454
Date: Fri, 10 Jan 2014 13:47:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73473

          Priority: medium
            Bug ID: 73473
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Potential crash bug in
                    src/gallium/auxiliary/rtasm/rtasm_execmem.c
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: jaak-89mTbI93R4uuvFJfX82//w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Drivers/DRI/nouveau
           Product: Mesa

glxgears[4186]: segfault at ffffffffffffffff ip 000078805fc4b901 sp
00007ce9598e21c0 error 7 in nouveau_dri.so[78805f7d1000+136c000]

Stracing it revealed that the crash happens after a mmap(NULL, 10485760,
PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE,MAP_ANONYMOUS, -1, 0) syscall
returns -1.

I think it might be caused by the return value of mmap not being checked in
src/gallium/auxiliary/rtasm/rtasm_execmem.c, leading to the the memory being
accessed somewhere else.

So it probably needs some

  if (exec_mem == MAP_FAILED)

check somewhere.

PS: Sorry if this is not the correct component.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389361621.bD8Bf0.28454
Date: Fri, 10 Jan 2014 13:47:01 +0000
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
   title="NEW --- - Potential crash bug in src/gallium/auxiliary/rtasm/rtasm_execmem.c"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73473">73473</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Potential crash bug in src/gallium/auxiliary/rtasm/rtasm_execmem.c
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
          <td>jaak&#64;ristioja.ee
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
        <pre>glxgears[4186]: segfault at ffffffffffffffff ip 000078805fc4b901 sp
00007ce9598e21c0 error 7 in nouveau_dri.so[78805f7d1000+136c000]

Stracing it revealed that the crash happens after a mmap(NULL, 10485760,
PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE,MAP_ANONYMOUS, -1, 0) syscall
returns -1.

I think it might be caused by the return value of mmap not being checked in
src/gallium/auxiliary/rtasm/rtasm_execmem.c, leading to the the memory being
accessed somewhere else.

So it probably needs some

  if (exec_mem == MAP_FAILED)

check somewhere.

PS: Sorry if this is not the correct component.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389361621.bD8Bf0.28454--

--===============1944323219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1944323219==--
