From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68456] [NV4B] null deref on load,
	NvI2C=1 makes it work
Date: Fri, 23 Aug 2013 01:13:40 +0000
Message-ID: <bug-68456-8800-y7cOQZV7gj@http.bugs.freedesktop.org/>
References: <bug-68456-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1088354259=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68456-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1088354259==
Content-Type: multipart/alternative; boundary="1377220420.A0DdbF32.22047"; charset="us-ascii"


--1377220420.A0DdbF32.22047
Date: Fri, 23 Aug 2013 01:13:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68456

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
The code decodes to

  1c:   51                      push   %rcx
  1d:   48 8b 47 18             mov    0x18(%rdi),%rax
  21:   48 8b 38                mov    (%rax),%rdi
  24:   48 8b 87 50 03 00 00    mov    0x350(%rdi),%rax
  2b:*  48 8b 00                mov    (%rax),%rax              <-- trapping
instruction
  2e:   48 85 c0                test   %rax,%rax
  31:   74 02                   je     0x35
  33:   ff d0                   callq  *%rax
  35:   31 c0                   xor    %eax,%eax
  37:   5a                      pop    %rdx
  38:   c3                      retq   

Which means that port->func is NULL. Still trying to work out exactly how that
happens.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377220420.A0DdbF32.22047
Date: Fri, 23 Aug 2013 01:13:40 +0000
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
   title="NEW --- - [NV4B] null deref on load, NvI2C=1 makes it work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68456#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4B] null deref on load, NvI2C=1 makes it work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68456">bug 68456</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>The code decodes to

  1c:   51                      push   %rcx
  1d:   48 8b 47 18             mov    0x18(%rdi),%rax
  21:   48 8b 38                mov    (%rax),%rdi
  24:   48 8b 87 50 03 00 00    mov    0x350(%rdi),%rax
  2b:*  48 8b 00                mov    (%rax),%rax              &lt;-- trapping
instruction
  2e:   48 85 c0                test   %rax,%rax
  31:   74 02                   je     0x35
  33:   ff d0                   callq  *%rax
  35:   31 c0                   xor    %eax,%eax
  37:   5a                      pop    %rdx
  38:   c3                      retq   

Which means that port-&gt;func is NULL. Still trying to work out exactly how that
happens.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377220420.A0DdbF32.22047--

--===============1088354259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1088354259==--
