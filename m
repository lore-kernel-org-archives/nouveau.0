From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 45112] [NV96] Kernel panic while using Firefox
Date: Mon, 19 Aug 2013 23:20:44 +0000
Message-ID: <bug-45112-8800-oT4i132duC@http.bugs.freedesktop.org/>
References: <bug-45112-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0016405516=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-45112-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0016405516==
Content-Type: multipart/alternative; boundary="1376954444.0C17C2.4494"; charset="us-ascii"


--1376954444.0C17C2.4494
Date: Mon, 19 Aug 2013 23:20:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=45112

Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #4 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
It seems like both of you must have very little VRAM which stresses the memory
allocator. 

Some work has been done on this issue although it isn't perfect yet. Can you
please confirm the bug is still present?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376954444.0C17C2.4494
Date: Mon, 19 Aug 2013 23:20:44 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV96] Kernel panic while using Firefox"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=45112">bug 45112</a>
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
   title="NEEDINFO --- - [NV96] Kernel panic while using Firefox"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=45112#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - [NV96] Kernel panic while using Firefox"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=45112">bug 45112</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>It seems like both of you must have very little VRAM which stresses the memory
allocator. 

Some work has been done on this issue although it isn't perfect yet. Can you
please confirm the bug is still present?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376954444.0C17C2.4494--

--===============0016405516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0016405516==--
