From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69180] [NVC1] Delays when using nouveau and
	switcheroo
Date: Tue, 10 Sep 2013 15:14:24 +0000
Message-ID: <bug-69180-8800-QtQpoaoLlr@http.bugs.freedesktop.org/>
References: <bug-69180-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1825732393=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69180-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1825732393==
Content-Type: multipart/alternative; boundary="1378826064.cB4cBfAB2.2366"; charset="us-ascii"


--1378826064.cB4cBfAB2.2366
Date: Tue, 10 Sep 2013 15:14:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69180

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Delays when using nouveau   |[NVC1] Delays when using
                   |and switcheroo              |nouveau and switcheroo

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #0)
> AFAIK the Nvidia graphics card sends its output to the Intel card, which is
> responsible for the graphics output to the screen. So I guess the problem is
> that switcheroo disables the Intel card which causes the graphics output to
> stop.

If you don't have a hardware mux, stay away from vgaswitcheroo. Take a look at
http://nouveau.freedesktop.org/wiki/Optimus/.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378826064.cB4cBfAB2.2366
Date: Tue, 10 Sep 2013 15:14:24 +0000
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
   title="NEW --- - [NVC1] Delays when using nouveau and switcheroo"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69180">bug 69180</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Delays when using nouveau and switcheroo
           </td>
           <td>[NVC1] Delays when using nouveau and switcheroo
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] Delays when using nouveau and switcheroo"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69180#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] Delays when using nouveau and switcheroo"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69180">bug 69180</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=69180#c0">comment #0</a>)
<span class="quote">&gt; AFAIK the Nvidia graphics card sends its output to the Intel card, which is
&gt; responsible for the graphics output to the screen. So I guess the problem is
&gt; that switcheroo disables the Intel card which causes the graphics output to
&gt; stop.</span >

If you don't have a hardware mux, stay away from vgaswitcheroo. Take a look at
<a href="http://nouveau.freedesktop.org/wiki/Optimus/">http://nouveau.freedesktop.org/wiki/Optimus/</a>.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378826064.cB4cBfAB2.2366--

--===============1825732393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1825732393==--
