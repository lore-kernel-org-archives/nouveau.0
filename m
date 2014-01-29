From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74195] [NVCE] Responsivity to input with vsync on is
 slower after update
Date: Wed, 29 Jan 2014 20:45:21 +0000
Message-ID: <bug-74195-8800-RNLZRBviVw@http.bugs.freedesktop.org/>
References: <bug-74195-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2111364615=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74195-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2111364615==
Content-Type: multipart/alternative; boundary="1391028320.884CAf2.32749"; charset="us-ascii"


--1391028320.884CAf2.32749
Date: Wed, 29 Jan 2014 20:45:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74195

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Responsivity to input with  |[NVCE] Responsivity to
                   |vsync on is slower after    |input with vsync on is
                   |update                      |slower after update

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
On the surface, this should have been a no-op change. You say you tried
different kernel versions... is that to say you did a git bisect? e.g. can you
confirm that 0fa9061ae8c10a9178d696cf48d94c3bf2848f9f has the issue but
0fa9061ae8c10a9178d696cf48d94c3bf2848f9f^ doesn't?

One small difference that I noticed is that if stat == ~0 in the old code it'll
return IRQ_NONE, whereas it will try to handle it in after the patch. I can't
imagine that matters here though.

Something to look at is what it is that the drm framework provided with the
irq's that's not done by nouveau now.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391028320.884CAf2.32749
Date: Wed, 29 Jan 2014 20:45:20 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVCE] Responsivity to input with vsync on is slower after update"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74195">bug 74195</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Responsivity to input with vsync on is slower after update
           </td>
           <td>[NVCE] Responsivity to input with vsync on is slower after update
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVCE] Responsivity to input with vsync on is slower after update"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74195#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVCE] Responsivity to input with vsync on is slower after update"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74195">bug 74195</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>On the surface, this should have been a no-op change. You say you tried
different kernel versions... is that to say you did a git bisect? e.g. can you
confirm that 0fa9061ae8c10a9178d696cf48d94c3bf2848f9f has the issue but
0fa9061ae8c10a9178d696cf48d94c3bf2848f9f^ doesn't?

One small difference that I noticed is that if stat == ~0 in the old code it'll
return IRQ_NONE, whereas it will try to handle it in after the patch. I can't
imagine that matters here though.

Something to look at is what it is that the drm framework provided with the
irq's that's not done by nouveau now.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391028320.884CAf2.32749--

--===============2111364615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2111364615==--
