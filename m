From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80266] New: Undefined operation in tgsi_ureg.c left
 shift of 1 by 31 places cannot be represented in type 'int'
Date: Fri, 20 Jun 2014 05:46:58 +0000
Message-ID: <bug-80266-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1397042353=="
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


--===============1397042353==
Content-Type: multipart/alternative; boundary="1403243218.2cb80f8f0.19353"; charset="us-ascii"


--1403243218.2cb80f8f0.19353
Date: Fri, 20 Jun 2014 05:46:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80266

          Priority: medium
            Bug ID: 80266
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Undefined operation in tgsi_ureg.c left shift of 1 by
                    31 places cannot be represented in type 'int'
          Severity: minor
    Classification: Unclassified
                OS: Linux (All)
          Reporter: zeccav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 10.2
         Component: Drivers/DRI/nouveau
           Product: Mesa

In tgsi_ureg.c:1498
"if (ureg->vs_inputs[i/32] & (1 << (i%32))) {"
when i==31 then 1 << 31 may be computed.
With gcc option -std=c99 this is wrong because the result cannot be int.

Perhaps the right instruction is
"if (ureg->vs_inputs[i/32] & ((unsigned) 1 << (i%32))) {"

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403243218.2cb80f8f0.19353
Date: Fri, 20 Jun 2014 05:46:58 +0000
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
   title="NEW --- - Undefined operation in tgsi_ureg.c left shift of 1 by 31 places cannot be represented in type 'int'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80266">80266</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Undefined operation in tgsi_ureg.c left shift of 1 by 31 places cannot be represented in type 'int'
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>minor
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
          <td>zeccav&#64;gmail.com
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
          <td>10.2
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
        <pre>In tgsi_ureg.c:1498
&quot;if (ureg-&gt;vs_inputs[i/32] &amp; (1 &lt;&lt; (i%32))) {&quot;
when i==31 then 1 &lt;&lt; 31 may be computed.
With gcc option -std=c99 this is wrong because the result cannot be int.

Perhaps the right instruction is
&quot;if (ureg-&gt;vs_inputs[i/32] &amp; ((unsigned) 1 &lt;&lt; (i%32))) {&quot;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403243218.2cb80f8f0.19353--

--===============1397042353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1397042353==--
