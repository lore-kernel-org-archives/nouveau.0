From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64074] New: Mesalib Installation Error
Date: Tue, 30 Apr 2013 07:42:19 +0000
Message-ID: <bug-64074-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1565369536=="
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


--===============1565369536==
Content-Type: multipart/alternative; boundary="1367307739.cD0eeD0.14642"; charset="us-ascii"


--1367307739.cD0eeD0.14642
Date: Tue, 30 Apr 2013 07:42:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D64074

          Priority: medium
            Bug ID: 64074
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

Mesalib installation :

i have set environement variable=20
export NOUVEAU_CFLAGS=3D"-I/usr/include/nouveau/ \
-I/usr/include/drm/"
export NOUVEAU_LIBS=3D"-L/usr/local/lib/"
after i run ./configure
then i run make i get this message=20

usr/include/drm/nouveau_pushbuf.h: In function =E2=80=98OUT_RING=E2=80=99:
/usr/include/drm/nouveau_pushbuf.h:72: error: =E2=80=98struct nouveau_chann=
el=E2=80=99 has no
member named =E2=80=98cur=E2=80=99
/usr/include/drm/nouveau_pushbuf.h: In function =E2=80=98AVAIL_RING=E2=80=
=99:
/usr/include/drm/nouveau_pushbuf.h:93: error: =E2=80=98struct nouveau_chann=
el=E2=80=99 has no
member named =E2=80=98end=E2=80=99
/usr/include/drm/nouveau_pushbuf.h:93: error: =E2=80=98struct nouveau_chann=
el=E2=80=99 has no
member named =E2=80=98cur=E2=80=99
/usr/include/drm/nouveau_pushbuf.h: In function =E2=80=98WAIT_RING=E2=80=99:
/usr/include/drm/nouveau_pushbuf.h:100: error: =E2=80=98struct nouveau_chan=
nel=E2=80=99 has no
member named =E2=80=98cur=E2=80=99
/usr/include/drm/nouveau_pushbuf.h:100: error: =E2=80=98struct nouveau_chan=
nel=E2=80=99 has no
member named =E2=80=98end=E2=80=99
/usr/include/drm/nouveau_pushbuf.h: In function =E2=80=98OUT_RELOC=E2=80=99:
/usr/include/drm/nouveau_pushbuf.h:114: error: =E2=80=98struct nouveau_chan=
nel=E2=80=99 has no
member named =E2=80=98cur=E2=80=99
/usr/include/drm/nouveau_pushbuf.h: In function =E2=80=98OUT_RELOC2=E2=80=
=99:
/usr/include/drm/nouveau_pushbuf.h:124: error: =E2=80=98struct nouveau_chan=
nel=E2=80=99 has no
member named =E2=80=98cur=E2=80=99
make[6]: *** [nouveau_screen.o] Error 1

avec la la contenu des fcichiers suivant :

------------- nouveau_pushbhf.h-------------

#ifndef __NOUVEAU_PUSHBUF_H__
#define __NOUVEAU_PUSHBUF_H__

#include <assert.h>
#include <string.h>

#include "nouveau/nouveau_channel.h"
#include "nouveau_bo.h"
#include "nouveau_grobj.h"
int
nouveau_pushbuf_flush(struct nouveau_channel *, unsigned min);

int
nouveau_pushbuf_marker_emit(struct nouveau_channel *chan,
       unsigned wait_dwords, unsigned wait_relocs);

void
nouveau_pushbuf_marker_undo(struct nouveau_channel *chan);

int
nouveau_pushbuf_emit_reloc(struct nouveau_channel *, void *ptr,
      struct nouveau_bo *, uint32_t data, uint32_t data2,
      uint32_t flags, uint32_t vor, uint32_t tor);

int
nouveau_pushbuf_submit(struct nouveau_channel *chan, struct nouveau_bo *bo,
         unsigned offset, unsigned length);

/* Push buffer access macros */
static __inline__ int
MARK_RING(struct nouveau_channel *chan, unsigned dwords, unsigned relocs)
{
 return nouveau_pushbuf_marker_emit(chan, dwords, relocs);
}

static __inline__ void
MARK_UNDO(struct nouveau_channel *chan)
{
 nouveau_pushbuf_marker_undo(chan);
}

static __inline__ void
OUT_RING(struct nouveau_channel *chan, unsigned data)
{
 *(chan->cur++) =3D (data);
}

static __inline__ void
OUT_RINGp(struct nouveau_channel *chan, const void *data, unsigned size)
{
 //memcpy(chan->cur, data, size * 4);
 //chan->cur +=3D size;
}

static __inline__ void
OUT_RINGf(struct nouveau_channel *chan, float f)
{
 union { uint32_t i; float f; } c;
 c.f =3D f;
 OUT_RING(chan, c.i);
}

static __inline__ unsigned
AVAIL_RING(struct nouveau_channel *chan)
{
 return chan->end - chan->cur;
//return NULL;
}

static __inline__ void
WAIT_RING(struct nouveau_channel *chan, unsigned size)
{
 if (chan->cur + size > chan->end)
  nouveau_pushbuf_flush(chan, size);
}

static __inline__ void
FIRE_RING(struct nouveau_channel *chan)
{
 nouveau_pushbuf_flush(chan, 0);
}

static __inline__ int
OUT_RELOC(struct nouveau_channel *chan, struct nouveau_bo *bo,
   unsigned data, unsigned flags, unsigned vor, unsigned tor)
{
 return nouveau_pushbuf_emit_reloc(chan, chan->cur++, bo,
       data, 0, flags, vor, tor);
//return NULL;
}

static __inline__ int
OUT_RELOC2(struct nouveau_channel *chan, struct nouveau_bo *bo,
    unsigned data, unsigned data2, unsigned flags,
    unsigned vor, unsigned tor)
{
 return nouveau_pushbuf_emit_reloc(chan, chan->cur++, bo,
       data, data2, flags, vor, tor);
//return NULL;
}

/* Raw data + flags depending on FB/TT buffer */
static __inline__ int
OUT_RELOCd(struct nouveau_channel *chan, struct nouveau_bo *bo,
    unsigned data, unsigned flags, unsigned vor, unsigned tor)
{
 return OUT_RELOC(chan, bo, data, flags | NOUVEAU_BO_OR, vor, tor);
}

/* FB/TT object handle */
static __inline__ int
OUT_RELOCo(struct nouveau_channel *chan, struct nouveau_bo *bo,
    unsigned flags)
{
 return OUT_RELOC(chan, bo, 0, flags | NOUVEAU_BO_OR,
    chan->vram->handle, chan->gart->handle);
}

/* Low 32-bits of offset */
static __inline__ int
OUT_RELOCl(struct nouveau_channel *chan, struct nouveau_bo *bo,
    unsigned delta, unsigned flags)
{
 return OUT_RELOC(chan, bo, delta, flags | NOUVEAU_BO_LOW, 0, 0);
}

/* Low 32-bits of offset + GPU linear access range info */
static __inline__ int
OUT_RELOCr(struct nouveau_channel *chan, struct nouveau_bo *bo,
    unsigned delta, unsigned size, unsigned flags)
{
 return OUT_RELOC2(chan, bo, delta, size, flags | NOUVEAU_BO_LOW, 0, 0);
}

/* High 32-bits of offset */
static __inline__ int
OUT_RELOCh(struct nouveau_channel *chan, struct nouveau_bo *bo,
    unsigned delta, unsigned flags)
{
 return OUT_RELOC(chan, bo, delta, flags | NOUVEAU_BO_HIGH, 0, 0);
}

#endif

------------- nouveau_grobj.h------------
#define __NOUVEAU_GROBJ_H__

#include "nouveau_channel.h"

struct nouveau_grobj {
 struct nouveau_channel *channel;
 int grclass;
 uint32_t handle;

 enum {
  NOUVEAU_GROBJ_UNBOUND =3D 0,
  NOUVEAU_GROBJ_BOUND =3D 1,
  NOUVEAU_GROBJ_BOUND_EXPLICIT =3D 2
 } bound;
 int subc;
};

int nouveau_grobj_alloc(struct nouveau_channel *, uint32_t handle,
          int class, struct nouveau_grobj **);
int nouveau_grobj_ref(struct nouveau_channel *, uint32_t handle,
        struct nouveau_grobj **);
void nouveau_grobj_free(struct nouveau_grobj **);
void nouveau_grobj_autobind(struct nouveau_grobj *);

#endif
-----------------nouveau_chanel.h-------------------

#ifndef __NOUVEAU_CHANNEL_H__
#define __NOUVEAU_CHANNEL_H__

struct nouveau_subchannel {
 struct nouveau_grobj *gr;
 unsigned sequence;
};

struct nouveau_channel {
 uint32_t *cur;
 uint32_t *end;

 struct nouveau_device *device;
 int id;

 struct nouveau_grobj *nullobj;
 struct nouveau_grobj *vram;
 struct nouveau_grobj *gart;

 void *user_private;
 void (*hang_notify)(struct nouveau_channel *);
 void (*flush_notify)(struct nouveau_channel *);

 struct nouveau_subchannel subc[8];
 unsigned subc_sequence;
};

int
nouveau_channel_alloc(struct nouveau_device *, uint32_t fb, uint32_t tt,
        int pushbuf_size, struct nouveau_channel **);

void
nouveau_channel_free(struct nouveau_channel **);

#endif

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1367307739.cD0eeD0.14642
Date: Tue, 30 Apr 2013 07:42:19 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Mesalib Installation Error"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D64074">64074</a>
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
        <pre>Mesalib installation :

i have set environement variable=20
export NOUVEAU_CFLAGS=3D&quot;-I/usr/include/nouveau/ \
-I/usr/include/drm/&quot;
export NOUVEAU_LIBS=3D&quot;-L/usr/local/lib/&quot;
after i run ./configure
then i run make i get this message=20

usr/include/drm/nouveau_pushbuf.h: In function =E2=80=98OUT_RING=E2=80=99:
/usr/include/drm/nouveau_pushbuf.h:72: error: =E2=80=98struct nouveau_chann=
el=E2=80=99 has no
member named =E2=80=98cur=E2=80=99
/usr/include/drm/nouveau_pushbuf.h: In function =E2=80=98AVAIL_RING=E2=80=
=99:
/usr/include/drm/nouveau_pushbuf.h:93: error: =E2=80=98struct nouveau_chann=
el=E2=80=99 has no
member named =E2=80=98end=E2=80=99
/usr/include/drm/nouveau_pushbuf.h:93: error: =E2=80=98struct nouveau_chann=
el=E2=80=99 has no
member named =E2=80=98cur=E2=80=99
/usr/include/drm/nouveau_pushbuf.h: In function =E2=80=98WAIT_RING=E2=80=99:
/usr/include/drm/nouveau_pushbuf.h:100: error: =E2=80=98struct nouveau_chan=
nel=E2=80=99 has no
member named =E2=80=98cur=E2=80=99
/usr/include/drm/nouveau_pushbuf.h:100: error: =E2=80=98struct nouveau_chan=
nel=E2=80=99 has no
member named =E2=80=98end=E2=80=99
/usr/include/drm/nouveau_pushbuf.h: In function =E2=80=98OUT_RELOC=E2=80=99:
/usr/include/drm/nouveau_pushbuf.h:114: error: =E2=80=98struct nouveau_chan=
nel=E2=80=99 has no
member named =E2=80=98cur=E2=80=99
/usr/include/drm/nouveau_pushbuf.h: In function =E2=80=98OUT_RELOC2=E2=80=
=99:
/usr/include/drm/nouveau_pushbuf.h:124: error: =E2=80=98struct nouveau_chan=
nel=E2=80=99 has no
member named =E2=80=98cur=E2=80=99
make[6]: *** [nouveau_screen.o] Error 1

avec la la contenu des fcichiers suivant :

------------- nouveau_pushbhf.h-------------

#ifndef __NOUVEAU_PUSHBUF_H__
#define __NOUVEAU_PUSHBUF_H__

#include &lt;assert.h&gt;
#include &lt;string.h&gt;

#include &quot;nouveau/nouveau_channel.h&quot;
#include &quot;nouveau_bo.h&quot;
#include &quot;nouveau_grobj.h&quot;
int
nouveau_pushbuf_flush(struct nouveau_channel *, unsigned min);

int
nouveau_pushbuf_marker_emit(struct nouveau_channel *chan,
       unsigned wait_dwords, unsigned wait_relocs);

void
nouveau_pushbuf_marker_undo(struct nouveau_channel *chan);

int
nouveau_pushbuf_emit_reloc(struct nouveau_channel *, void *ptr,
      struct nouveau_bo *, uint32_t data, uint32_t data2,
      uint32_t flags, uint32_t vor, uint32_t tor);

int
nouveau_pushbuf_submit(struct nouveau_channel *chan, struct nouveau_bo *bo,
         unsigned offset, unsigned length);

/* Push buffer access macros */
static __inline__ int
MARK_RING(struct nouveau_channel *chan, unsigned dwords, unsigned relocs)
{
 return nouveau_pushbuf_marker_emit(chan, dwords, relocs);
}

static __inline__ void
MARK_UNDO(struct nouveau_channel *chan)
{
 nouveau_pushbuf_marker_undo(chan);
}

static __inline__ void
OUT_RING(struct nouveau_channel *chan, unsigned data)
{
 *(chan-&gt;cur++) =3D (data);
}

static __inline__ void
OUT_RINGp(struct nouveau_channel *chan, const void *data, unsigned size)
{
 //memcpy(chan-&gt;cur, data, size * 4);
 //chan-&gt;cur +=3D size;
}

static __inline__ void
OUT_RINGf(struct nouveau_channel *chan, float f)
{
 union { uint32_t i; float f; } c;
 c.f =3D f;
 OUT_RING(chan, c.i);
}

static __inline__ unsigned
AVAIL_RING(struct nouveau_channel *chan)
{
 return chan-&gt;end - chan-&gt;cur;
//return NULL;
}

static __inline__ void
WAIT_RING(struct nouveau_channel *chan, unsigned size)
{
 if (chan-&gt;cur + size &gt; chan-&gt;end)
  nouveau_pushbuf_flush(chan, size);
}

static __inline__ void
FIRE_RING(struct nouveau_channel *chan)
{
 nouveau_pushbuf_flush(chan, 0);
}

static __inline__ int
OUT_RELOC(struct nouveau_channel *chan, struct nouveau_bo *bo,
   unsigned data, unsigned flags, unsigned vor, unsigned tor)
{
 return nouveau_pushbuf_emit_reloc(chan, chan-&gt;cur++, bo,
       data, 0, flags, vor, tor);
//return NULL;
}

static __inline__ int
OUT_RELOC2(struct nouveau_channel *chan, struct nouveau_bo *bo,
    unsigned data, unsigned data2, unsigned flags,
    unsigned vor, unsigned tor)
{
 return nouveau_pushbuf_emit_reloc(chan, chan-&gt;cur++, bo,
       data, data2, flags, vor, tor);
//return NULL;
}

/* Raw data + flags depending on FB/TT buffer */
static __inline__ int
OUT_RELOCd(struct nouveau_channel *chan, struct nouveau_bo *bo,
    unsigned data, unsigned flags, unsigned vor, unsigned tor)
{
 return OUT_RELOC(chan, bo, data, flags | NOUVEAU_BO_OR, vor, tor);
}

/* FB/TT object handle */
static __inline__ int
OUT_RELOCo(struct nouveau_channel *chan, struct nouveau_bo *bo,
    unsigned flags)
{
 return OUT_RELOC(chan, bo, 0, flags | NOUVEAU_BO_OR,
    chan-&gt;vram-&gt;handle, chan-&gt;gart-&gt;handle);
}

/* Low 32-bits of offset */
static __inline__ int
OUT_RELOCl(struct nouveau_channel *chan, struct nouveau_bo *bo,
    unsigned delta, unsigned flags)
{
 return OUT_RELOC(chan, bo, delta, flags | NOUVEAU_BO_LOW, 0, 0);
}

/* Low 32-bits of offset + GPU linear access range info */
static __inline__ int
OUT_RELOCr(struct nouveau_channel *chan, struct nouveau_bo *bo,
    unsigned delta, unsigned size, unsigned flags)
{
 return OUT_RELOC2(chan, bo, delta, size, flags | NOUVEAU_BO_LOW, 0, 0);
}

/* High 32-bits of offset */
static __inline__ int
OUT_RELOCh(struct nouveau_channel *chan, struct nouveau_bo *bo,
    unsigned delta, unsigned flags)
{
 return OUT_RELOC(chan, bo, delta, flags | NOUVEAU_BO_HIGH, 0, 0);
}

#endif

------------- nouveau_grobj.h------------
#define __NOUVEAU_GROBJ_H__

#include &quot;nouveau_channel.h&quot;

struct nouveau_grobj {
 struct nouveau_channel *channel;
 int grclass;
 uint32_t handle;

 enum {
  NOUVEAU_GROBJ_UNBOUND =3D 0,
  NOUVEAU_GROBJ_BOUND =3D 1,
  NOUVEAU_GROBJ_BOUND_EXPLICIT =3D 2
 } bound;
 int subc;
};

int nouveau_grobj_alloc(struct nouveau_channel *, uint32_t handle,
          int class, struct nouveau_grobj **);
int nouveau_grobj_ref(struct nouveau_channel *, uint32_t handle,
        struct nouveau_grobj **);
void nouveau_grobj_free(struct nouveau_grobj **);
void nouveau_grobj_autobind(struct nouveau_grobj *);

#endif
-----------------nouveau_chanel.h-------------------

#ifndef __NOUVEAU_CHANNEL_H__
#define __NOUVEAU_CHANNEL_H__

struct nouveau_subchannel {
 struct nouveau_grobj *gr;
 unsigned sequence;
};

struct nouveau_channel {
 uint32_t *cur;
 uint32_t *end;

 struct nouveau_device *device;
 int id;

 struct nouveau_grobj *nullobj;
 struct nouveau_grobj *vram;
 struct nouveau_grobj *gart;

 void *user_private;
 void (*hang_notify)(struct nouveau_channel *);
 void (*flush_notify)(struct nouveau_channel *);

 struct nouveau_subchannel subc[8];
 unsigned subc_sequence;
};

int
nouveau_channel_alloc(struct nouveau_device *, uint32_t fb, uint32_t tt,
        int pushbuf_size, struct nouveau_channel **);

void
nouveau_channel_free(struct nouveau_channel **);

#endif</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1367307739.cD0eeD0.14642--

--===============1565369536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1565369536==--
