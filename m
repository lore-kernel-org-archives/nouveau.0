From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72939] [nv96] Freespace 2 open crashes
Date: Sun, 19 Jan 2014 12:14:37 +0000
Message-ID: <bug-72939-8800-v1hciB3JEp@http.bugs.freedesktop.org/>
References: <bug-72939-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0324790342=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72939-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0324790342==
Content-Type: multipart/alternative; boundary="1390133677.2f2D1.17710"; charset="us-ascii"


--1390133677.2f2D1.17710
Date: Sun, 19 Jan 2014 12:14:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72939

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
This error is telling you that an invalid opcode was attempted to get executed.
On the bright side, envydis agrees that it's an invalid opcode. So either we
have a bug in generating shaders, or it's something more sinister.

If you run a debug mesa build with NV50_PROG_DEBUG=1, it should dump all the
shaders being compiled -- that should at least let us know if we're generating
the wrong opcodes or not. Basically look for the 80070279 00060780 sequence in
the generated program binaries that are printed out. If you do find it, grab
the whole shader binary as well as the lines that precede it, including the
TGSI that caused it to be generated, and upload that here.

If it's not there, then... that's very unfortunate -- it means some sort of
memory corruption issue. Let's hope it's the more straightforward problem.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390133677.2f2D1.17710
Date: Sun, 19 Jan 2014 12:14:37 +0000
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
   title="NEW --- - [nv96] Freespace 2 open crashes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72939#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nv96] Freespace 2 open crashes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72939">bug 72939</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>This error is telling you that an invalid opcode was attempted to get executed.
On the bright side, envydis agrees that it's an invalid opcode. So either we
have a bug in generating shaders, or it's something more sinister.

If you run a debug mesa build with NV50_PROG_DEBUG=1, it should dump all the
shaders being compiled -- that should at least let us know if we're generating
the wrong opcodes or not. Basically look for the 80070279 00060780 sequence in
the generated program binaries that are printed out. If you do find it, grab
the whole shader binary as well as the lines that precede it, including the
TGSI that caused it to be generated, and upload that here.

If it's not there, then... that's very unfortunate -- it means some sort of
memory corruption issue. Let's hope it's the more straightforward problem.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390133677.2f2D1.17710--

--===============0324790342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0324790342==--
