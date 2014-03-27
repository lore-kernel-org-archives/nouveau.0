From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76475] [NVE7] fails to load due to unknown opcode
 0x80 (incorrect vbios)
Date: Thu, 27 Mar 2014 11:08:51 +0000
Message-ID: <bug-76475-8800-8kkqZh0xA6@http.bugs.freedesktop.org/>
References: <bug-76475-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2146015017=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76475-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2146015017==
Content-Type: multipart/alternative; boundary="1395918531.7F61a1.30541"; charset="us-ascii"


--1395918531.7F61a1.30541
Date: Thu, 27 Mar 2014 11:08:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76475

--- Comment #12 from patrick.clara-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I have attached the output of "echo w > /proc/sysrq-trigger".

The kworker shows up in "top" as kworker/7:1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395918531.7F61a1.30541
Date: Thu, 27 Mar 2014 11:08:51 +0000
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
   title="NEW --- - [NVE7] fails to load due to unknown opcode 0x80 (incorrect vbios)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76475#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] fails to load due to unknown opcode 0x80 (incorrect vbios)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76475">bug 76475</a>
              from <span class="vcard"><a class="email" href="mailto:patrick.clara&#64;gmail.com" title="patrick.clara&#64;gmail.com">patrick.clara&#64;gmail.com</a>
</span></b>
        <pre>I have attached the output of &quot;echo w &gt; /proc/sysrq-trigger&quot;.

The kworker shows up in &quot;top&quot; as kworker/7:1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395918531.7F61a1.30541--

--===============2146015017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2146015017==--
