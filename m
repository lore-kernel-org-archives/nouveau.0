From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [bug report] drm/nouveau: move io_reserve_lru handling
 into the driver v5
Date: Wed, 9 Sep 2020 14:49:24 +0300
Message-ID: <20200909114924.GA17899@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: christian.koenig-5C7GfCeVMHo@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hello Christian K=F6nig,

The patch 141b15e59175: "drm/nouveau: move io_reserve_lru handling
into the driver v5" from Aug 21, 2020, leads to the following static
checker warning:

	drivers/gpu/drm/nouveau/nouveau_ttm.c:148 nouveau_ttm_fault()
	warn: inconsistent returns '*bo->base.resv'.

drivers/gpu/drm/nouveau/nouveau_ttm.c
   126  static vm_fault_t nouveau_ttm_fault(struct vm_fault *vmf)
   127  {
   128          struct vm_area_struct *vma =3D vmf->vma;
   129          struct ttm_buffer_object *bo =3D vma->vm_private_data;
   130          pgprot_t prot;
   131          vm_fault_t ret;
   132  =

   133          ret =3D ttm_bo_vm_reserve(bo, vmf);
   134          if (ret)
   135                  return ret;
   136  =

   137          nouveau_bo_del_io_reserve_lru(bo);
   138  =

   139          prot =3D vm_get_page_prot(vma->vm_flags);
   140          ret =3D ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_P=
REFAULT, 1);
   141          if (ret =3D=3D VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_=
RETRY_NOWAIT))
   142                  return ret;
                        ^^^^^^^^^^
Call dma_resv_unlock() before returning?

   143  =

   144          nouveau_bo_add_io_reserve_lru(bo);
   145  =

   146          dma_resv_unlock(bo->base.resv);
   147  =

   148          return ret;
   149  }

regards,
dan carpenter
