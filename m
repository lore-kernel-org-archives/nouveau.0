From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60175] [NVA8] Repeatable kernel panics in iowrite32
 when visiting websites with adobe flash enabled
Date: Sat, 31 Aug 2013 05:58:27 +0000
Message-ID: <bug-60175-8800-Mkh1pG6HWT@http.bugs.freedesktop.org/>
References: <bug-60175-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0684502056=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60175-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0684502056==
Content-Type: multipart/alternative; boundary="1377928707.F7D0E1.24087"; charset="us-ascii"


--1377928707.F7D0E1.24087
Date: Sat, 31 Aug 2013 05:58:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60175

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Repeatable kernel panics    |[NVA8] Repeatable kernel
                   |when visiting websites with |panics in iowrite32 when
                   |adobe flash enabled         |visiting websites with
                   |                            |adobe flash enabled

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I used to get this on older kernels too, but it doesn't seem to happen anymore.
Can you see if this is still an issue for you in 3.10.x or 3.11-rc7?

If it still happens, can you find some exact websites (publically accessible)
that cause it (and what browser)?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377928707.F7D0E1.24087
Date: Sat, 31 Aug 2013 05:58:27 +0000
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
   title="NEW --- - [NVA8] Repeatable kernel panics in iowrite32 when visiting websites with adobe flash enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60175">bug 60175</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Repeatable kernel panics when visiting websites with adobe flash enabled
           </td>
           <td>[NVA8] Repeatable kernel panics in iowrite32 when visiting websites with adobe flash enabled
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] Repeatable kernel panics in iowrite32 when visiting websites with adobe flash enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60175#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] Repeatable kernel panics in iowrite32 when visiting websites with adobe flash enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60175">bug 60175</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I used to get this on older kernels too, but it doesn't seem to happen anymore.
Can you see if this is still an issue for you in 3.10.x or 3.11-rc7?

If it still happens, can you find some exact websites (publically accessible)
that cause it (and what browser)?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377928707.F7D0E1.24087--

--===============0684502056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0684502056==--
