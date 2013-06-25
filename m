From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66176] nouveau.perflvl kernel parameter doesn't work
Date: Tue, 25 Jun 2013 23:38:14 +0000
Message-ID: <bug-66176-8800-mBsysktiX7@http.bugs.freedesktop.org/>
References: <bug-66176-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1170854515=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66176-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1170854515==
Content-Type: multipart/alternative; boundary="1372203494.DaEB1c02.20528"; charset="us-ascii"


--1372203494.DaEB1c02.20528
Date: Tue, 25 Jun 2013 23:38:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66176

Roy <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #1 from Roy <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org> ---
I'm sorry, but unfortunately reclocking is not implemented for this family of
cards (NV4x) in nouveau. None of the developers has such a board capable of
reclocking. I have marked this bug NEEDINFO because... well, we need a lot more
info about the internals of this card to be able to implement reclocking. Given
the amount of users actually still using NV49s (and the complete lack of
developer manpower on reclocking) it will probably end up being a
very-low-priority task though.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372203494.DaEB1c02.20528
Date: Tue, 25 Jun 2013 23:38:14 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:r.spliet&#64;student.tudelft.nl" title="Roy &lt;r.spliet&#64;student.tudelft.nl&gt;"> <span class="fn">Roy</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - nouveau.perflvl kernel parameter doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66176">bug 66176</a>
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
           <td>NEEDINFO
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - nouveau.perflvl kernel parameter doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66176#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - nouveau.perflvl kernel parameter doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66176">bug 66176</a>
              from <span class="vcard"><a class="email" href="mailto:r.spliet&#64;student.tudelft.nl" title="Roy &lt;r.spliet&#64;student.tudelft.nl&gt;"> <span class="fn">Roy</span></a>
</span></b>
        <pre>I'm sorry, but unfortunately reclocking is not implemented for this family of
cards (NV4x) in nouveau. None of the developers has such a board capable of
reclocking. I have marked this bug NEEDINFO because... well, we need a lot more
info about the internals of this card to be able to implement reclocking. Given
the amount of users actually still using NV49s (and the complete lack of
developer manpower on reclocking) it will probably end up being a
very-low-priority task though.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372203494.DaEB1c02.20528--

--===============1170854515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1170854515==--
