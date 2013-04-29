From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64042] New: Mesalib Installation Error
Date: Mon, 29 Apr 2013 11:01:27 +0000
Message-ID: <bug-64042-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1855433781=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1855433781==
Content-Type: multipart/alternative; boundary="1367233287.f5257a0.18437"; charset="us-ascii"


--1367233287.f5257a0.18437
Date: Mon, 29 Apr 2013 11:01:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64042

          Priority: medium
            Bug ID: 64042
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Mesalib Installation Error
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: andree.tago-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: 7.10
         Component: Drivers/DRI/nouveau
           Product: Mesa

hello,
I get the code source of Mesalib 7.11 and i configure this code

export NOUVEAU_CFLAGS="-I/usr/include/drm/"
export NOUVEAU_LIBS="-L/usr/local/lib/"

./confgure

when i run make i get this errors :

nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_pushbuf_flush'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_bo_pending'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_pushbuf_marker_undo'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_grobj_autobind'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_pushbuf_marker_emit'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_bo_unmap'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_channel_free'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_grobj_free'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_device_open_existing'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_pushbuf_emit_reloc'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_device_close'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_channel_alloc'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_bo_handle_get'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_bo_map'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_bo_new'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_bo_ref'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_bo_handle_ref'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_notifier_alloc'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_bo_new_tile'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_grobj_alloc'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_notifier_free'
collect2: ld returned 1 exit status
make[6]: *** [nouveau_vieux_dri.so] Error 1
make[6]: Leaving directory
`/home/administrateur/Bureau/Mesa-7.11/src/mesa/drivers/dri/nouveau'

Please Help Me

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1367233287.f5257a0.18437
Date: Mon, 29 Apr 2013 11:01:27 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Mesalib Installation Error"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64042">64042</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Mesalib Installation Error
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>andree.tago&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.10
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>hello,
I get the code source of Mesalib 7.11 and i configure this code

export NOUVEAU_CFLAGS=&quot;-I/usr/include/drm/&quot;
export NOUVEAU_LIBS=&quot;-L/usr/local/lib/&quot;

./confgure

when i run make i get this errors :

nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_pushbuf_flush'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_bo_pending'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_pushbuf_marker_undo'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_grobj_autobind'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_pushbuf_marker_emit'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_bo_unmap'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_channel_free'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_grobj_free'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_device_open_existing'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_pushbuf_emit_reloc'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_device_close'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_channel_alloc'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_bo_handle_get'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_bo_map'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_bo_new'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_bo_ref'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_bo_handle_ref'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_notifier_alloc'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_bo_new_tile'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_grobj_alloc'
nouveau_vieux_dri.so.tmp: undefined reference to `nouveau_notifier_free'
collect2: ld returned 1 exit status
make[6]: *** [nouveau_vieux_dri.so] Error 1
make[6]: Leaving directory
`/home/administrateur/Bureau/Mesa-7.11/src/mesa/drivers/dri/nouveau'

Please Help Me</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1367233287.f5257a0.18437--

--===============1855433781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1855433781==--
