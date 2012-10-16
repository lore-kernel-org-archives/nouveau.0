From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55948] [nvd9 optimus] drm/nouveau/bios: attempt to
 fetch entire acpi rom image in one shot breaks module load
Date: Tue, 16 Oct 2012 09:23:36 +0000
Message-ID: <bug-55948-8800-j3zB87Ao1D@http.bugs.freedesktop.org/>
References: <bug-55948-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0714580410=="
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


--===============0714580410==
Content-Type: multipart/alternative; boundary="1350379416.dCD21.6596"; charset="us-ascii"


--1350379416.dCD21.6596
Date: Tue, 16 Oct 2012 09:23:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55948

Peter Wu <lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #4 from Peter Wu <lekensteyn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
The DSDT does not contain a _ROM method. It must be in one of the SSDT files,
can you run:

    acpidump > acpidump.txt
and attach the acpidump.txt file? You need to install acpidump first.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1350379416.dCD21.6596
Date: Tue, 16 Oct 2012 09:23:36 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:lekensteyn&#64;gmail.com" title="Peter Wu &lt;lekensteyn&#64;gmail.com&gt;"> <span class="fn">Peter Wu</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvd9 optimus] drm/nouveau/bios: attempt to fetch entire acpi rom image in one shot breaks module load"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55948">bug 55948</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>lekensteyn&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvd9 optimus] drm/nouveau/bios: attempt to fetch entire acpi rom image in one shot breaks module load"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55948#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvd9 optimus] drm/nouveau/bios: attempt to fetch entire acpi rom image in one shot breaks module load"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55948">bug 55948</a>
              from <span class="vcard"><a class="email" href="mailto:lekensteyn&#64;gmail.com" title="Peter Wu &lt;lekensteyn&#64;gmail.com&gt;"> <span class="fn">Peter Wu</span></a>
</span></b>
        <pre>The DSDT does not contain a _ROM method. It must be in one of the SSDT files,
can you run:

    acpidump &gt; acpidump.txt
and attach the acpidump.txt file? You need to install acpidump first.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1350379416.dCD21.6596--

--===============0714580410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0714580410==--
