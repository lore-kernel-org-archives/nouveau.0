From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71116] [any/all(?) cards below nv50(?)] libdrm built
 with gcc4.8 causes crashes/lockups during normal operation,
 and resume from disk/memory
Date: Thu, 07 Nov 2013 10:51:55 +0000
Message-ID: <bug-71116-8800-vKOzPPYuN4@http.bugs.freedesktop.org/>
References: <bug-71116-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2023481085=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71116-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2023481085==
Content-Type: multipart/alternative; boundary="1383821515.BeD8Ac02.11869"; charset="us-ascii"


--1383821515.BeD8Ac02.11869
Date: Thu, 7 Nov 2013 10:51:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71116

--- Comment #21 from Maarten Lankhorst <bugs-FcfepWsj2zOByvU0x3ry2g@public.gmane.org> ---
Compiled code with this patch:

00000000000015b0 <nouveau_pushbuf_reloc>:
    15b0:       55                      push   %rbp
    15b1:       48 8b 6f 30             mov    0x30(%rdi),%rbp
    15b5:       53                      push   %rbx
    15b6:       48 89 fb                mov    %rdi,%rbx
    15b9:       e8 42 ea ff ff          callq  0 <pushbuf_krel>
    15be:       89 45 00                mov    %eax,0x0(%rbp)
    15c1:       48 83 43 30 04          addq   $0x4,0x30(%rbx)
    15c6:       5b                      pop    %rbx
    15c7:       5d                      pop    %rbp
    15c8:       c3                      retq   

Without:
0000000000001650 <nouveau_pushbuf_reloc>:
    1650:       48 89 5c 24 f0          mov    %rbx,-0x10(%rsp)
    1655:       48 89 6c 24 f8          mov    %rbp,-0x8(%rsp)
    165a:       48 83 ec 10             sub    $0x10,%rsp
    165e:       48 8b 6f 30             mov    0x30(%rdi),%rbp
    1662:       48 89 fb                mov    %rdi,%rbx
    1665:       e8 96 e9 ff ff          callq  0 <pushbuf_krel>
    166a:       89 45 00                mov    %eax,0x0(%rbp)
    166d:       48 83 c5 04             add    $0x4,%rbp
    1671:       48 89 6b 30             mov    %rbp,0x30(%rbx)
    1675:       48 8b 1c 24             mov    (%rsp),%rbx
    1679:       48 8b 6c 24 08          mov    0x8(%rsp),%rbp
    167e:       48 83 c4 10             add    $0x10,%rsp
    1682:       c3                      retq   

It seems that the nouveau_pushbuf_reloc difference is harmless. Code is
equivalent, except that without the patch applied it uses another temp variable
causing less optimal code generation.

Remaining candidates: pushbuf_validate, nouveau_pushbuf_data,
nouveau_pushbuf_del.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383821515.BeD8Ac02.11869
Date: Thu, 7 Nov 2013 10:51:55 +0000
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
   title="NEW --- - [any/all(?) cards below nv50(?)] libdrm built with gcc4.8 causes crashes/lockups during normal operation, and resume from disk/memory"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71116#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [any/all(?) cards below nv50(?)] libdrm built with gcc4.8 causes crashes/lockups during normal operation, and resume from disk/memory"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71116">bug 71116</a>
              from <span class="vcard"><a class="email" href="mailto:bugs&#64;mblankhorst.nl" title="Maarten Lankhorst &lt;bugs&#64;mblankhorst.nl&gt;"> <span class="fn">Maarten Lankhorst</span></a>
</span></b>
        <pre>Compiled code with this patch:

00000000000015b0 &lt;nouveau_pushbuf_reloc&gt;:
    15b0:       55                      push   %rbp
    15b1:       48 8b 6f 30             mov    0x30(%rdi),%rbp
    15b5:       53                      push   %rbx
    15b6:       48 89 fb                mov    %rdi,%rbx
    15b9:       e8 42 ea ff ff          callq  0 &lt;pushbuf_krel&gt;
    15be:       89 45 00                mov    %eax,0x0(%rbp)
    15c1:       48 83 43 30 04          addq   $0x4,0x30(%rbx)
    15c6:       5b                      pop    %rbx
    15c7:       5d                      pop    %rbp
    15c8:       c3                      retq   

Without:
0000000000001650 &lt;nouveau_pushbuf_reloc&gt;:
    1650:       48 89 5c 24 f0          mov    %rbx,-0x10(%rsp)
    1655:       48 89 6c 24 f8          mov    %rbp,-0x8(%rsp)
    165a:       48 83 ec 10             sub    $0x10,%rsp
    165e:       48 8b 6f 30             mov    0x30(%rdi),%rbp
    1662:       48 89 fb                mov    %rdi,%rbx
    1665:       e8 96 e9 ff ff          callq  0 &lt;pushbuf_krel&gt;
    166a:       89 45 00                mov    %eax,0x0(%rbp)
    166d:       48 83 c5 04             add    $0x4,%rbp
    1671:       48 89 6b 30             mov    %rbp,0x30(%rbx)
    1675:       48 8b 1c 24             mov    (%rsp),%rbx
    1679:       48 8b 6c 24 08          mov    0x8(%rsp),%rbp
    167e:       48 83 c4 10             add    $0x10,%rsp
    1682:       c3                      retq   

It seems that the nouveau_pushbuf_reloc difference is harmless. Code is
equivalent, except that without the patch applied it uses another temp variable
causing less optimal code generation.

Remaining candidates: pushbuf_validate, nouveau_pushbuf_data,
nouveau_pushbuf_del.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383821515.BeD8Ac02.11869--

--===============2023481085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2023481085==--
