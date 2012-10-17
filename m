From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55948] [nvd9 optimus] drm/nouveau/bios: attempt to
 fetch entire acpi rom image in one shot breaks module load
Date: Wed, 17 Oct 2012 01:39:43 +0000
Message-ID: <bug-55948-8800-oSJvXkVyoX@http.bugs.freedesktop.org/>
References: <bug-55948-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0383981849=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-55948-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0383981849==
Content-Type: multipart/alternative; boundary="1350437983.1da75c2.7868"; charset="us-ascii"


--1350437983.1da75c2.7868
Date: Wed, 17 Oct 2012 01:39:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55948

Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
           Assignee|nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org |skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
                   |rg                          |

--- Comment #6 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 68662
  --> https://bugs.freedesktop.org/attachment.cgi?id=68662&action=edit
fallback to slow _ROM access if checksum fails

How do you go if you apply this?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1350437983.1da75c2.7868
Date: Wed, 17 Oct 2012 01:39:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED --- - [nvd9 optimus] drm/nouveau/bios: attempt to fetch entire acpi rom image in one shot breaks module load"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55948">bug 55948</a>
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
         </tr>

         <tr>
           <td style="text-align:right;">Assignee</td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
           <td>skeggsb&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED --- - [nvd9 optimus] drm/nouveau/bios: attempt to fetch entire acpi rom image in one shot breaks module load"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55948#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED --- - [nvd9 optimus] drm/nouveau/bios: attempt to fetch entire acpi rom image in one shot breaks module load"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55948">bug 55948</a>
              from <span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=68662" name="attach_68662" title="fallback to slow _ROM access if checksum fails">attachment 68662</a> <a href="attachment.cgi?id=68662&amp;action=edit" title="fallback to slow _ROM access if checksum fails">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=55948&amp;attachment=68662'>[review]</a>
fallback to slow _ROM access if checksum fails

How do you go if you apply this?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1350437983.1da75c2.7868--

--===============0383981849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0383981849==--
