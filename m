From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 36090] [NV34] [NV49] terminal's visual bell is very
 slow with nouveau
Date: Tue, 20 Aug 2013 02:14:00 +0000
Message-ID: <bug-36090-8800-qoeDix5LHm@http.bugs.freedesktop.org/>
References: <bug-36090-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0521985307=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-36090-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0521985307==
Content-Type: multipart/alternative; boundary="1376964840.7dF25104.988"; charset="us-ascii"


--1376964840.7dF25104.988
Date: Tue, 20 Aug 2013 02:14:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=36090

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|terminal's visual bell is   |[NV34] [NV49] terminal's
                   |very slow with nouveau      |visual bell is very slow
                   |                            |with nouveau

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Could you retest with a newer kernel/DDX? This feels like the sort of thing
that probably got fixed over the past couple of years.

Note to the NV49 user, there's currently a bug in 3.11-rcX that will cause
nouveau to crash on start (for nv49 and nv4e). Either use 3.10, the
nouveau/master tree, or cherry pick
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=42f186b6af54b82dcee926a35440b74dbabe1623
(this will hopefully make the final 3.11 release).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376964840.7dF25104.988
Date: Tue, 20 Aug 2013 02:14:00 +0000
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
   title="NEW --- - [NV34] [NV49] terminal's visual bell is very slow with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=36090">bug 36090</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>terminal's visual bell is very slow with nouveau
           </td>
           <td>[NV34] [NV49] terminal's visual bell is very slow with nouveau
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] [NV49] terminal's visual bell is very slow with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=36090#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] [NV49] terminal's visual bell is very slow with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=36090">bug 36090</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Could you retest with a newer kernel/DDX? This feels like the sort of thing
that probably got fixed over the past couple of years.

Note to the NV49 user, there's currently a bug in 3.11-rcX that will cause
nouveau to crash on start (for nv49 and nv4e). Either use 3.10, the
nouveau/master tree, or cherry pick
<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=42f186b6af54b82dcee926a35440b74dbabe1623">http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=42f186b6af54b82dcee926a35440b74dbabe1623</a>
(this will hopefully make the final 3.11 release).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376964840.7dF25104.988--

--===============0521985307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0521985307==--
