From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 48742] [NV30 gallium] fbotexture -arb misrenders on
	nv43
Date: Tue, 20 Aug 2013 06:10:37 +0000
Message-ID: <bug-48742-8800-aCVEsoXX68@http.bugs.freedesktop.org/>
References: <bug-48742-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2087464186=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-48742-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2087464186==
Content-Type: multipart/alternative; boundary="1376979037.07F3FD1.29514"; charset="us-ascii"


--1376979037.07F3FD1.29514
Date: Tue, 20 Aug 2013 06:10:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=48742

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|fbotexture -arb misrenders  |[NV30 gallium] fbotexture
                   |on nv43                     |-arb misrenders on nv43

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Reproduced on a NV34 with both Mesa 9.1.6 and the semi-latest 9.3-git checkout
(probably as of a few days ago, definitely no nv30 changes in there). The bad
rendering is identical in all 3 of the fbotexture modes. (BTW, this took me a
sec to figure out -- fbotexture is in the mesa/demos repo.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376979037.07F3FD1.29514
Date: Tue, 20 Aug 2013 06:10:37 +0000
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
   title="NEW --- - [NV30 gallium] fbotexture -arb misrenders on nv43"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48742">bug 48742</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>fbotexture -arb misrenders on nv43
           </td>
           <td>[NV30 gallium] fbotexture -arb misrenders on nv43
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV30 gallium] fbotexture -arb misrenders on nv43"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48742#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV30 gallium] fbotexture -arb misrenders on nv43"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48742">bug 48742</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Reproduced on a NV34 with both Mesa 9.1.6 and the semi-latest 9.3-git checkout
(probably as of a few days ago, definitely no nv30 changes in there). The bad
rendering is identical in all 3 of the fbotexture modes. (BTW, this took me a
sec to figure out -- fbotexture is in the mesa/demos repo.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376979037.07F3FD1.29514--

--===============2087464186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2087464186==--
