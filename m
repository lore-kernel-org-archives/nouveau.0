From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70212] glxinfo triggers assert in cso_release_all
 after 3f0627c2ad6
Date: Sat, 12 Oct 2013 18:52:24 +0000
Message-ID: <bug-70212-8800-BtkOIainwa@http.bugs.freedesktop.org/>
References: <bug-70212-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1538166440=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70212-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1538166440==
Content-Type: multipart/alternative; boundary="1381603944.Cf8cE2.7824"; charset="us-ascii"


--1381603944.Cf8cE2.7824
Date: Sat, 12 Oct 2013 18:52:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70212

Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #3 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #2)
> Another interesting point is that with the bind_*_sampler_states hooks the
> drivers where left to handle cases of 0 samplers on their own - with nouveau
> and radeon doing additional work (state tracking afaics). Whereas with the
> unified bind_sampler_states() in case of 0 samplers the driver hook is not
> executed. Is that change intentional ?

Scratch that

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381603944.Cf8cE2.7824
Date: Sat, 12 Oct 2013 18:52:24 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED --- - glxinfo triggers assert in cso_release_all after 3f0627c2ad6"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70212">bug 70212</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>ASSIGNED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED --- - glxinfo triggers assert in cso_release_all after 3f0627c2ad6"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70212#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED --- - glxinfo triggers assert in cso_release_all after 3f0627c2ad6"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70212">bug 70212</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=70212#c2">comment #2</a>)
<span class="quote">&gt; Another interesting point is that with the bind_*_sampler_states hooks the
&gt; drivers where left to handle cases of 0 samplers on their own - with nouveau
&gt; and radeon doing additional work (state tracking afaics). Whereas with the
&gt; unified bind_sampler_states() in case of 0 samplers the driver hook is not
&gt; executed. Is that change intentional ?</span >

Scratch that</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381603944.Cf8cE2.7824--

--===============1538166440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1538166440==--
